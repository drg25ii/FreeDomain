FROM python:3.9-slim

WORKDIR /app

# Copiem tot conținutul din prima (pentru a fi siguri că prindem toate fișierele)
COPY . .

# Ne mutăm unde este codul serverului
WORKDIR /app/opensource/whois_server

# Încercăm să instalăm requirements dacă există, dacă nu, instalăm Flask direct
RUN if [ -f requirements.txt ]; then pip install -r requirements.txt; else pip install flask gunicorn; fi

# Expunem portul pentru Koyeb
ENV PORT=80
EXPOSE 80

# Pornim aplicația
# Verifică dacă în 'whois_server' fișierul de start este chiar 'app.py'
CMD ["python", "app.py"]
