FROM node:12.16.3

WORKDIR /usr/app

COPY . .
RUN npm install

EXPOSE 3000
CMD [ "npm", "run", "start" ]