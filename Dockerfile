FROM nginx:alpine
# Copiar ambas versiones
COPY glenngo/ /usr/share/nginx/html/glenngo/
COPY replai-pilot/ /usr/share/nginx/html/replai-pilot/
# nginx config que distingue por Host header
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
