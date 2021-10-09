# syntax=docker/dockerfile:1
FROM node:14

WORKDIR /root


COPY package*.json ./
RUN npm i && npm cache clean --force

COPY . .
RUN npm install -g @babel/core@7.11.6 @babel/cli@7.11.6
RUN npm run build

RUN chown node:node .
USER node

EXPOSE 5002 80 443

CMD ["node", "/root/build"]