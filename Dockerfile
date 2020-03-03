FROM node:10-alpine

ENV NODE_ENV=production
ENV HOST=localhost
ENV APP_UID=9999
ENV APP_GID=9999
ENV APP_USER=node
ENV APP_HOME=/usr/src/app

WORKDIR $APP_HOME

COPY package*.json ./

RUN apk --no-cache add shadow \
   && groupmod -g $APP_GID $APP_USER \
   && usermod -u $APP_UID -g $APP_GID $APP_USER \
   && chown -R $APP_UID:$APP_GID $APP_HOME \
   && rm -rf /var/cache/apk/* \
   && npm ci

USER $APP_UID

COPY . ./

EXPOSE 3000
CMD node merge.js -o merged.json WES-swagger-template.json $WF_SEARCH_API $WF_MANAGEMENT_API && node app.js
