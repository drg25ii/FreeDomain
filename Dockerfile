FROM nginx:alpine

# 1. Curățăm folderul Nginx
RUN rm -rf /usr/share/nginx/html/*

# 2. Copiem tot conținutul folderului frontend (asigură-te că folderul se numește exact așa)
COPY ./opensource/frontend/ /usr/share/nginx/html/

# 3. Copiem și folderele statice dacă există, pentru imagini/stiluri
COPY ./opensource/static/ /usr/share/nginx/html/static/

# 4. Forțăm permisiunile de citire (foarte important pe Koyeb)
RUN chmod -R 755 /usr/share/nginx/html

# 5. Verificăm dacă există vreun fișier .html în interiorul folderului frontend
# Dacă fișierul tău se numește 'login.html' sau 'home.html' în loc de 'index.html', 
# Nginx va da mereu 403.
