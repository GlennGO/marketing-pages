FROM nginx:alpine
COPY glenngo/ /usr/share/nginx/html/glenngo/
COPY replai-pilot/ /usr/share/nginx/html/replai-pilot/
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
