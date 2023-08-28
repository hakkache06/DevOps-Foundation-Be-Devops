FROM nginx:alpine
MAINTAINER <hakkacheyassin@gmail.com>
COPY website /website
COPY nginx.conf  /etc/nginx/nginx.conf
EXPOSE 80