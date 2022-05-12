#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpinels
COPY --from=node /app/dist/accounts /usr/share/nginx/html