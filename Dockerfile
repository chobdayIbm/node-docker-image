FROM node:12-alpine AS BUILD_IMAGE

WORKDIR /usr/app
COPY . .
RUN npm install --only=production

FROM node:12-alpine
WORKDIR /usr/app
COPY --from=BUILD_IMAGE /usr/app/node_modules ./node_modules
COPY --from=BUILD_IMAGE /usr/app/views ./views
COPY --from=BUILD_IMAGE /usr/app/package.json ./package.json
COPY --from=BUILD_IMAGE /usr/app/server.js ./server.js



EXPOSE 3000
CMD [ "npm", "run", "start" ]