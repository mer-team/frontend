FROM node:12-alpine

# Change this to the API URL
ARG URL_API=192.168.49.2:30080

ENV REACT_APP_URL_API $URL_API

COPY ./src /frontend

WORKDIR /frontend

ENV PATH /frontend/nodeModules/.bin:$PATH

RUN npm install

CMD [ "npm", "start" ]

EXPOSE 3000
