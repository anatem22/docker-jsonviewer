FROM nginx:alpine

RUN rm -rf /urs/share/nginx/html/*

WORKDIR /usr/share/nginx/html
COPY ./jsonviewer /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf 

RUN \
chmod -R a+rwx /etc/nginx && \
chmod -R a+rwx /usr/share/nginx/html

EXPOSE 8080
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
