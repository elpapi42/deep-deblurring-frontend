FROM node:lts-alpine
LABEL maintainer="Bohorquez Whitman"

RUN npm install -g http-server
WORKDIR /deep-deblurring-frontend
COPY package*.json ./
RUN npm install
COPY . .

CMD [ "npm", "run", "serve" ]