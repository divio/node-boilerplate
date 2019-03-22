FROM node:10.15.3

COPY . /app
WORKDIR /app

RUN npm install

# noop files for non python projects and local development
RUN echo "#!/bin/bash" > /app/migrate.sh && chmod +x /app/migrate.sh
RUN echo "#!/bin/bash" > /usr/local/bin/start && chmod +x /usr/local/bin/start

ENV PATH=/node_modules/.bin:$PATH

EXPOSE 80

CMD ["npm", "start"]
