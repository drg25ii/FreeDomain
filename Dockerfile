FROM nginx:alpine

# Curățăm folderul implicit
RUN rm -rf /usr/share/nginx/html/*

# Copiem tot ce ai în folderul frontend
COPY ./opensource/frontend/ /usr/share/nginx/html/

# REPARARE: Redenumim login.html în index.html pentru a mulțumi Nginx și Koyeb
RUN cp /usr/share/nginx/html/login.html /usr/share/nginx/html/index.html

# Opțional: Copiem și restul resurselor dacă există
COPY ./opensource/static/ /usr/share/nginx/html/static/ || true

# Permisiuni de citire
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
