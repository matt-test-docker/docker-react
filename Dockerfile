FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
ENV NODE_OPTIONS="--openssl-legacy-provider"
RUN npm run build # outputs to /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
