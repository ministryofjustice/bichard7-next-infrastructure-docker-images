ARG BUILD_IMAGE="nodejs"
FROM ${BUILD_IMAGE}

WORKDIR /app

COPY package.json *.tgz /app/
RUN npm i

COPY * /app/
CMD npm t
