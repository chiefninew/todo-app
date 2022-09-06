FROM node:16.3.0-alpine

EXPOSE 4100

WORKDIR /app

COPY ["package.json","./"]
COPY ["package-lock.json","./"]

RUN npm install --silent

COPY ["/","./"]

RUN npm run build

CMD ["npx", "--yes", "serve", "build/", "-p", "4100"]