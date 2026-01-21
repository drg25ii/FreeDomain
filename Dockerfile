# Pasul 1: Folosim o imagine ușoară de Nginx
FROM nginx:alpine

# Pasul 2: Ștergem fișierele implicite ale Nginx
RUN rm -rf /usr/share/nginx/html/*

# Pasul 3: Copiem tot conținutul proiectului în folderul de servire Nginx
# Aceasta va include fișierele .html și restul resurselor
COPY . /usr/share/nginx/html/

# Pasul 4: Expunem portul 80 pentru trafic web
EXPOSE 80

# Pasul 5: Pornim serverul Nginx
CMD ["nginx", "-g", "daemon off;"]
