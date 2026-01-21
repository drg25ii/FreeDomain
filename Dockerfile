FROM python:3.9-slim
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
