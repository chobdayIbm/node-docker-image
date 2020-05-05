FROM node:12.16.3-alpine

WORKDIR /usr/app

COPY . .
RUN npm install --only=production

EXPOSE 3000
CMD [ "npm", "run", "start" ]