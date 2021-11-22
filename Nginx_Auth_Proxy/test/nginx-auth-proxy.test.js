const { MockServer } = require("jest-mock-server");
const https = require("https");
const axiosClass = require("axios").default;
const { isTypedArray } = require("util/types");
const axios = axiosClass.create({
  httpsAgent: new https.Agent({
    rejectUnauthorized: false,
  }),
});
const axiosConfig = { validateStatus: false };
const mockStatus = (status) => (ctx) => {
  ctx.status = status;
};
const mockResponse = (status, body) => (ctx) => {
  ctx.status = status;
  ctx.body = body;
};
const testHost = process.env.TEST_HOST || "localhost:6443";

describe("Testing Nginx config", () => {
  let servers;

  const mockAuth = () => {
    return servers.user
      .get("/users/api/auth")
      .mockImplementationOnce(mockStatus(200));
  };

  beforeAll(async () => {
    servers = {
      bichard: new MockServer({ port: 60001, https: true }),
      user: new MockServer({ port: 60002, https: true }),
      audit: new MockServer({ port: 60003, https: true }),
      static: new MockServer({ port: 60004, https: true }),
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
    { path: "/reports/x", route: "static", auth: true },
    { path: "/help/x", route: "static", auth: false },
    { path: "/users/x", route: "user", auth: true },
    { path: "/audit-logging/x", route: "audit", auth: true },
    { path: "/users/login", route: "user", auth: false },
    { path: "/users/assets/x", route: "user", auth: false },
    { path: "/users/403", route: "user", auth: false },
    { path: "/users/404", route: "user", auth: false },
    { path: "/users/500", route: "user", auth: false },
    { path: "/bichard-ui/Health", route: "bichard", auth: false },
    { path: "/bichard-ui/Connectivity", route: "bichard", auth: false },
    { path: "/bichard-ui/images/foo.gif", route: "bichard", auth: false },
    { path: "/bichard-ui/css/style.css", route: "bichard", auth: false },
  ];

  test.each(routes)(
    "Path $path routes to $route with auth: $auth",
    async ({ path, route, auth, dest }) => {
      const authMock = mockAuth();

      const destPath = dest || path;
      const mock = servers[route]
        .get(destPath)
        .mockImplementationOnce(mockStatus(200));

      const res = await axios.get(`https://${testHost}${path}`, axiosConfig);

      expect(res.status).toEqual(200);
      expect(mock).toHaveBeenCalledTimes(1);

      expect(authMock).toHaveBeenCalledTimes(auth ? 1 : 0);
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
      const mock = servers[route]
        .get(destPath)
        .mockImplementationOnce(mockStatus(200));
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

  test.each([403, 404, 500])(
    "Should use the %i page in the user service for this status code",
    async (status) => {
      const errorPage = `${status} Page`;
      const authMock = mockAuth();
      const mockErrorPage = servers.user
        .get(`/users/${status}`)
        .mockImplementationOnce(mockResponse(status, errorPage));

      const mock = servers.bichard
        .get("/bichard-ui/x")
        .mockImplementationOnce(mockStatus(status));

      const res = await axios.get(
        `https://${testHost}/bichard-ui/x`,
        axiosConfig
      );

      expect(res.status).toEqual(status);
      expect(res.data).toEqual(errorPage);
      expect(authMock).toHaveBeenCalledTimes(1);
      expect(mock).toHaveBeenCalledTimes(1);
      expect(mockErrorPage).toHaveBeenCalledTimes(1);
    }
  );

  test.each([
    { url: "/bichard-ui/x", upstream: "bichard" },
    { url: "/users/x", upstream: "user" },
    { url: "/audit-logging/x", upstream: "audit" },
    { url: "/reports/x", upstream: "static" },
  ])(
    "Should pass through the host header for $url to $upstream",
    async ({ url, upstream, dest }) => {
      const expectedResponse = `Response from ${upstream}`;
      mockAuth();
      const mockUpstream = servers[upstream]
        .get(dest || url)
        .mockImplementationOnce(mockResponse(200, expectedResponse));
      const res = await axios.get(`https://${testHost}${url}`, {
        ...axiosConfig,
        headers: { Host: "external.host" },
      });

      expect(res.data).toEqual(expectedResponse);
      expect(mockUpstream).toHaveBeenCalledTimes(1);
      expect(mockUpstream.mock.calls[0][0].request.header.host).toEqual(
        "external.host"
      );
    }
  );

  test.each([
    { url: "/bichard-ui/x", upstream: "bichard" },
    { url: "/users/x", upstream: "user" },
    { url: "/audit-logging/x", upstream: "audit" },
    { url: "/reports/x", upstream: "static" },
  ])(
    "Should not pass when performing OPTIONS requests for $upstream",
    async ({ url, upstream, dest }) => {
      const expectedStatus = 403;
      mockAuth();
      const mockUpstream = servers[upstream]
        .get(dest || url)
        .mockImplementationOnce(mockResponse(200, ""));
      let res = await axios.options(`https://${testHost}${url}`, axiosConfig);

      expect(res.status).toEqual(expectedStatus);
      expect(mockUpstream).toHaveBeenCalledTimes(0);
      res = await axios.get(`https://${testHost}${url}`, axiosConfig);

      expect(res.status).toEqual(200);
    }
  );
});
