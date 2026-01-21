[00:49, 1/22/2026] Iulica Drg: FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install flask gunicorn

# Forțăm portul 80 pentru Koyeb
ENV PORT=80
EXPOSE 80

# Mergem în folderul de frontend pentru a porni interfața grafică
# Aceasta va asculta pe portul 80 și va fi acceptată de Koyeb
WORKDIR /app/opensource/whois_server

# Modificăm app.py să asculte pe 0.0.0.0:80
CMD ["python", "app.py", "--host=0.0.0.0", "--port=80"]
[00:53, 1/22/2026] Iulica Drg: ENV WHOIS_PORT=80
# Sau dacă aplicația caută variabila PORT
ENV PORT=80
EXPOSE 80
[00:56, 1/22/2026] Iulica Drg: FROM python:3.9-slim

# Setăm directorul de lucru
WORKDIR /app

# Copiem fișierele
COPY . .

# Instalăm dependențele de bază
RUN pip install flask gunicorn

# Expunem portul standard Koyeb
ENV PORT=80
EXPOSE 80

# Punctul de pornire: Mergem în folderul serverului și pornim app.py
# Am inclus și forțarea portului 80
WORKDIR /app/opensource/whois_server
CMD ["python", "app.py", "--host=0.0.0.0", "--port=80"]
