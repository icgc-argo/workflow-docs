FROM node:10-alpine

ENV NODE_ENV=production
ENV HOST=localhost
ENV APP_UID=9999
ENV APP_GID=9999

WORKDIR /usr/src/app

COPY package*.json ./

RUN apk --no-cache add shadow \
   && groupmod -g $APP_GID node \
   && usermod -u $APP_UID -g $APP_GID node \
   && rm -rf /var/cache/apk/* \
   && npm ci

COPY . ./

USER $APP_UID

CMD node merge.js -o merged.json WES-swagger-template.json $WF_SEARCH_API $WF_MANAGEMENT_API && node app.js
