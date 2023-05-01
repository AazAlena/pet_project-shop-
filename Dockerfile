FROM node:20

RUN mkdir /app && chown -R node:node /app
# Create app directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# USER node

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY --chown=node:node . .

# EXPOSE 8081
CMD [ "node", "index.js" ]