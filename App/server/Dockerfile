#  Dockerfile for Node Express Backend api (development) - alpine is a popular lightweight server
FROM node:14.15.3-alpine

# Create App Directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install Dependencies
COPY package*.json ./

RUN npm install

# Copy app source code
COPY . .

EXPOSE 8000

CMD ["npm","start"]