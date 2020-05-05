FROM node:12-alpine AS BUILD_IMAGE
RUN apk update && apk add curl bash
RUN curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh | bash -s -- -b /usr/local/bin

WORKDIR /usr/app
COPY . .
RUN npm install --only=production
RUN npm prune --production

FROM node:12-alpine
WORKDIR /usr/app
COPY --from=BUILD_IMAGE /usr/app/node_modules ./node_modules
COPY --from=BUILD_IMAGE /usr/app/views ./views
COPY --from=BUILD_IMAGE /usr/app/package.json ./package.json
COPY --from=BUILD_IMAGE /usr/app/server.js ./server.js



EXPOSE 3000
CMD [ "npm", "run", "start" ]