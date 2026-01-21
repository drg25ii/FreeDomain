FROM python:3.9-slim

WORKDIR /app

# Instalăm dependențele necesare
# Verifică dacă ai un fișier requirements.txt pe GitHub
COPY ./opensource/whois_server/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt || pip install flask gunicorn

# Copiem tot proiectul
COPY . .

# Ne mutăm unde este logica serverului
WORKDIR /app/opensource/whois_server

# Setăm variabila de port pentru Koyeb
ENV PORT=80

# Pornim aplicația folosind Gunicorn (recomandat pentru producție) sau direct Python
# Verifică dacă fișierul principal se numește app.py sau main.py
CMD ["python", "app.py"]
