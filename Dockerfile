FROM nginx:alpine

# Curățăm folderul Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiem TOT conținutul din repository pentru a fi siguri
COPY . /usr/share/nginx/html/

# Forțăm găsirea unui punct de intrare indiferent unde este ascuns
# Această comandă caută primul fișier .html găsit în subfoldere și îl pune ca index
RUN find /usr/share/nginx/html -name "login.html" -exec cp {} /usr/share/nginx/html/index.html \;

# Setăm permisiuni globale
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
