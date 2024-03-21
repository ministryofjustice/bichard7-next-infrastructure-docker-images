ARG BUILD_IMAGE="nodejs-20-2023"
FROM ${BUILD_IMAGE}

WORKDIR /app

COPY package.json *.tgz /app/
RUN npm i

COPY * /app/
CMD npm t
