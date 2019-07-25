FROM node:10

WORKDIR /app

ENV PATH /app/nod_modules/.bin:$PATH

COPY package.json .
COPY package-lock.json .

RUN npm install
RUN npm install react-scripts@3.0.1 -g

COPY . .

RUN npm i -g pm2


CMD ["pm2-runtime", "start", "node_modules/react-scripts/scripts/start.js", "--name", "front-end"]

#CMD ["pm2-runtime", "--name", "client", "--watch", "index.js"]
