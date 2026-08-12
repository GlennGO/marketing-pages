FROM nginx:alpine
COPY glenngo/ /usr/share/nginx/html/glenngo/
COPY replai-pilot/ /usr/share/nginx/html/replai-pilot/
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Cambiar puerto a 3000 para Coolify
RUN sed -i 's/listen 80/listen 3000/' /etc/nginx/conf.d/default.conf
EXPOSE 3000
