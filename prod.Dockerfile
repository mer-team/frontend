FROM node:12-alpine as build

# Change this to the API URL
ARG URL_API=localhost:8000
ENV REACT_APP_URL_API $URL_API

COPY ./src /frontend

WORKDIR /frontend

ENV PATH /frontend/nodeModules/.bin:$PATH

RUN npm install

RUN npm run build

# prod
FROM nginx:stable-alpine
RUN apk upgrade
COPY --from=build /frontend/build /usr/share/nginx/html
COPY /nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80