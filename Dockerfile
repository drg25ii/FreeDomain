
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*

# Copiem fișierele din folderul frontend în locația Nginx
COPY ./opensource/frontend/ /usr/share/nginx/html/

# Dacă proiectul are nevoie de fișierele statice separat:
COPY ./opensource/static/ /usr/share/nginx/html/static/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
