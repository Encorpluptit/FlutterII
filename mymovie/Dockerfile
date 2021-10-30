FROM node:16-alpine3.11
WORKDIR /app
COPY tsconfig.json ./
COPY package.json ./
COPY src ./src
RUN npm install
RUN npm run build
EXPOSE 8080
CMD ["node", "./dist/src/app.js"]
