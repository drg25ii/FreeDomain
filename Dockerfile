FROM python:3.9-slim
WORKDIR /app

# Copiem tot proiectul
COPY . .

# Instalăm dependențele de bază
RUN pip install flask gunicorn

# Setăm variabila de port pentru Koyeb
ENV PORT=80
EXPOSE 80

# COMANDĂ UNIVERSALĂ: 
# Caută orice fișier .py care conține "app" sau "main" și îl pornește
CMD ["sh", "-c", "python $(find . -name 'app.py' -o -name 'main.py' -o -name 'server.py' | head -n 1)"]
