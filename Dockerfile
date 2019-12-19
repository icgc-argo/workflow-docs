FROM node:7
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD node merge.js -o merged.json WES-swagger-template.json http://wf-search.light.overture.bio/v2/api-docs http://wf-management.light.overture.bio/v2/api-docs && node app.js
