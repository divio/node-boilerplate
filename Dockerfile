FROM node:6.10

# noop for legacy migration
RUN mkdir /app && \
    echo "#!/bin/bash" > /app/migrate.sh && \
    chmod +x /app/migrate.sh

COPY package.json .
RUN npm install

COPY . /app

EXPOSE 80
