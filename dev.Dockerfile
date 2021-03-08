FROM node:12-alpine

ARG URL_API=localhost:8000

COPY ./src /frontend

WORKDIR /frontend

ENV PATH /frontend/nodeModules/.bin:$PATH

RUN sed -i '/REACT_APP_URL_API=/c\REACT_APP_URL_API='$URL_API .env

RUN npm install

CMD [ "npm", "start" ]

EXPOSE 3000
