FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache chromium \
    && export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5488

CMD ["npm", "start"]