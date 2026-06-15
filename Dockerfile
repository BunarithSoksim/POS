# Stage 1
FROM node:18-alpine as node

ARG API_BASE_URL
ARG FILE_BASE_URL
ARG SOCKET_URL

WORKDIR /usr/app
RUN apk add --no-cache python3 make g++

COPY web-v4/package.json /usr/app/package.json
COPY web-v4/package-lock.json /usr/app/package-lock.json

RUN npm install --legacy-peer-deps

COPY web-v4/ /usr/app

RUN npm run build --prod

# Stage 2
FROM nginx:1.15.8-alpine

COPY --from=node /usr/app/dist /usr/share/nginx/html