# FROM node18/alpine  as build-stage

# WORKDIR /www/tonetone-index
# RUN node -v
# RUN npm i -g pnpm
# COPY . .
# RUN pnpm install 
# RUN pnpm setup
# RUN ls -a
# RUN pnpm build

FROM nginx:latest as production-stage

COPY ./public /www/tonetone-index

COPY ./nginx /www/nginx

RUN mkdir -p /www/tonetone-index/logs/nginx
RUN touch /www/tonetone-index/logs/nginx/error.log
RUN touch /www/tonetone-index/logs/nginx/access.log

EXPOSE 80

CMD ["nginx","-c","/www/nginx/nginx.conf" ,"-g", "daemon off;"]