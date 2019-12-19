FROM node:10
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
ENV NODE_ENV=production
COPY . ./
RUN node merge.js -o merged.json WES-swagger-template.json http://wf-search.light.overture.bio/v2/api-docs http://wf-management.light.overture.bio/v2/api-docs
CMD node app.js
