FROM node:16 as build

WORKDIR /app

COPY 2048-game .

RUN npm install --include=dev

RUN npm run build


FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 8080