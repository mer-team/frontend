FROM node:12-alpine as build

ARG URL_API=localhost:8000

COPY ./src /frontend

WORKDIR /frontend

ENV PATH /frontend/nodeModules/.bin:$PATH

RUN sed -i '/REACT_APP_URL_API=/c\REACT_APP_URL_API='$URL_API .env

RUN npm install

RUN npm run build

# prod
FROM nginx:stable-alpine
COPY --from=build /frontend/build /usr/share/nginx/html
EXPOSE 80