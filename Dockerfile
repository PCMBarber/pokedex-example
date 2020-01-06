FROM node:10-alpine as build
WORKDIR /build
COPY . .
RUN npm install
RUN npm run build
FROM nginx:latest
WORKDIR /app
COPY --from=build /build/dist .
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf