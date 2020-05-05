FROM node:12-alpine 
WORKDIR /usr/app
COPY . .
RUN npm install 
EXPOSE 3000
CMD [ "npm", "run", "start" ]