FROM node:16.3.0-alpine AS base
ARG BASE_URL
ENV BASE_URL=$BASE_URL
WORKDIR /app
EXPOSE 11100

FROM base AS build
COPY ["package.json","./"]
COPY ["package-lock.json","./"]
RUN npm install --silent
COPY ["/","./"]
RUN npm run build

FROM base AS final
COPY --from=build /app/build .
CMD ["npx", "--yes", "serve", ".", "-p", "11100"]
