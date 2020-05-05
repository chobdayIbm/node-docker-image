FROM node:8.10.0

# RUN mkdir -p /usr/app/build
WORKDIR /usr/app

COPY . .
# COPY ./build /usr/app/build
# COPY ./node_modules /usr/app/node_modules
# COPY ./package.json /usr/app/package.json
RUN npm install

EXPOSE 3000
CMD [ "npm", "run", "start" ]