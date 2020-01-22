FROM node:10
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
ENV NODE_ENV=production
ENV HOST=localhost
COPY . ./
CMD node merge.js -o merged.json WES-swagger-template.json $WF_SEARCH_API $WF_MANAGEMENT_API && node app.js
