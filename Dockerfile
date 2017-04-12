FROM node:6.10

COPY package.json .
RUN npm install

COPY . /app

# noop for legacy migration
RUN echo "#!/bin/bash" > /app/migrate.sh && \
    chmod +x /app/migrate.sh

EXPOSE 80

WORKDIR /app
CMD npm start
