FROM node:10

WORKDIR /app

COPY package.json .

COPY package-lock.json .

RUN npm install

COPY . .

RUN npm i -g pm2

CMD ["pm2-runtime", "--name", "backend", "--watch", "index.js"]
