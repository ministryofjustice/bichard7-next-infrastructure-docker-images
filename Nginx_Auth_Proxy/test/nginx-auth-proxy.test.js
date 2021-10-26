const { MockServer } = require("jest-mock-server");
const https = require("https");
const axiosClass = require("axios").default;
const axios = axiosClass.create({
  httpsAgent: new https.Agent({
    rejectUnauthorized: false,
  }),
});
const axiosConfig = { validateStatus: false };
const mock200 = (ctx) => {
  ctx.status = 200;
};
const testHost = process.env.TEST_HOST || "localhost:6443";

describe("Testing Nginx config", () => {
  let servers;
  beforeAll(async () => {
    servers = {
      bichard: new MockServer({ port: 60001, https: true }),
      user: new MockServer({ port: 60002, https: true }),
      audit: new MockServer({ port: 60003, https: true }),
      reports: new MockServer({ port: 60004, https: true }),
    };
    await Promise.all(Object.values(servers).map((server) => server.start()));
  });

  afterAll(async () => {
    await Promise.all(Object.values(servers).map((server) => server.stop()));
  });

  beforeEach(async () => {
    Object.values(servers).forEach((server) => server.reset());
  });

  const routes = [
    { path: "/bichard-ui/x", route: "bichard", auth: true },
    { path: "/reports/x", route: "reports", auth: true, dest: "/x" },
    { path: "/users/x", route: "user", auth: true },
    { path: "/audit-logging/x", route: "audit", auth: true },
    { path: "/users/login", route: "user", auth: false },
    { path: "/users/assets/x", route: "user", auth: false },
    { path: "/users/access-denied", route: "user", auth: false },
    { path: "/bichard-ui/Health", route: "bichard", auth: false },
    { path: "/bichard-ui/Connectivity", route: "bichard", auth: false },
    { path: "/bichard-ui/images/foo.gif", route: "bichard", auth: false },
    { path: "/bichard-ui/css/style.css", route: "bichard", auth: false },
  ];

  test.each(routes)(
    "Path $path routes to $route with auth: $auth",
    async ({ path, route, auth, dest }) => {
      let authMock;
      if (auth) {
        authMock = servers.user
          .get("/users/api/auth")
          .mockImplementationOnce(mock200);
      }

      const destPath = dest || path;
      const mock = servers[route].get(destPath).mockImplementationOnce(mock200);

      const res = await axios.get(`https://${testHost}${path}`, axiosConfig);

      expect(res.status).toEqual(200);
      expect(mock).toHaveBeenCalledTimes(1);

      if (auth) {
        expect(authMock).toHaveBeenCalledTimes(1);
      }
    }
  );

  test.each(routes)(
    "It should forward cookie from $path with auth: $auth",
    async ({ path, route, auth, dest }) => {
      servers.user.get("/users/api/auth").mockImplementationOnce((ctx) => {
        ctx.cookies.set(".AUTH", "Realistic", { sameSite: true, secure: true });
        ctx.status = 200;
      });
      const destPath = dest || path;
      const mock = servers[route].get(destPath).mockImplementationOnce(mock200);
      const res = await axios.get(`https://${testHost}${path}`, axiosConfig);

      if (auth) {
        expect(res.headers["set-cookie"]).toEqual([
          ".AUTH=Realistic; path=/; samesite=strict; secure; httponly",
        ]);
      } else {
        expect(res.headers["set-cookie"]).toEqual([
          "Path=/; HttpOnly; Secure; SameSite=strict",
        ]);
      }
    }
  );
});
