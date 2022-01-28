FROM node:lts-alpine

WORKDIR /dbSeeder

COPY package-*.json /dbSeeder/
COPY . . 

RUN npm install

CMD ["node", "./src/dbSeeder.js"]