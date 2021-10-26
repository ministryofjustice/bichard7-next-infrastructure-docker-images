FROM nodejs

WORKDIR /app

COPY package.json *.tgz /app/
RUN npm i

COPY * /app/
CMD npm t
