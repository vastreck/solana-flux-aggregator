FROM node:14-alpine AS deps

WORKDIR /app

COPY package.json yarn.lock tsconfig.json ./

RUN apk add --no-cache git
RUN yarn install
RUN yarn global add typescript

COPY ./src ./src

RUN tsc --outDir dist

#run:
#docker run -e NETWORK=dev --rm flux:$tag node dist/cli.js read-median HBVsLHp8mWGMGfrh1Gf5E8RAxww71mXBgoZa6Zvsk5cK