
FROM nginx:alpine

# Ștergem conținutul vechi
RUN rm -rf /usr/share/nginx/html/*

# Copiem tot conținutul proiectului
COPY . /usr/share/nginx/html/

# VERIFICARE: Dacă fișierele tale sunt într-un folder numit 'templates' (specific Flask), 
# trebuie să le scoatem la suprafață. Adaugă această linie dacă eroarea persistă:
# RUN mv /usr/share/nginx/html/templates/* /usr/share/nginx/html/ || true

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
