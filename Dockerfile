FROM node:12-alpine

WORKDIR /usr/src/app

EXPOSE 8080

COPY . .

RUN yarn

CMD ["yarn", "serve"]