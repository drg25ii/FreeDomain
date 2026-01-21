FROM python:3.9-slim
WORKDIR /app
COPY . .

# Această linie instalează Flask chiar dacă nu există requirements.txt
RUN pip install flask gunicorn

# Setăm portul Koyeb
ENV PORT=80
EXPOSE 80

# Pornim direct din folderul unde este serverul
WORKDIR /app/opensource/whois_server
CMD ["python", "app.py"]
