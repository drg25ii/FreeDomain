FROM python:3.9-slim
WORKDIR /app
COPY . .

RUN pip install flask gunicorn

# Intrăm în folderul serverului
WORKDIR /app/opensource/whois_server

# AICI TREBUIE NUMELE CORECT AL FIȘIERULUI
# Schimbă main.py cu ce vezi tu pe GitHub în acel folder
CMD ["python", "main.py"]
