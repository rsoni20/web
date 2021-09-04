# Stage 1
FROM node:14-alpine as build

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod

EXPOSE 80

# Stage 2
FROM nginx:1.17.1-alpine

COPY --from=build /app/dist/web /usr/share/nginx/html
