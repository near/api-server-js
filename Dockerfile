FROM node:18-alpine

# Creating app directory
WORKDIR /usr/src/app

# Copying with * to include both package.json and package-lock.json
COPY package*.json ./

RUN npm ci

# Copying the app files
COPY receipts.js ./
COPY snapshot.js ./
COPY app.js ./
COPY res/* ./res/

EXPOSE 3030

ENV NODE_ENV=production

CMD [ "node", "app.js" ]