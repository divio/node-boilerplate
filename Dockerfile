FROM node:10.15.1-alpine

COPY package.json .
RUN npm install

COPY . /app

# noop for legacy migration
RUN echo "#!/bin/bash" > /app/migrate.sh && \
    chmod +x /app/migrate.sh

EXPOSE 80

WORKDIR /app
CMD npm start
