FROM node:8-slim

WORKDIR /my-server

COPY . .

RUN npm install -g nodemon
RUN npm install

EXPOSE 3000
CMD [ "npm", "start" ]