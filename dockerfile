FROM node:8-slim

WORKDIR /my-server

COPY . /my-server
RUN npm install

EXPOSE 3000
CMD [ "npm", "start" ]