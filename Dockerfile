FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install flask gunicorn

# Forțăm Flask să ruleze pe portul 80 și pe toate interfețele (0.0.0.0)
ENV PORT=80
EXPOSE 80

WORKDIR /app/opensource/whois_server

# Modificăm comanda să specifice portul și host-ul
CMD ["python", "app.py", "--host=0.0.0.0", "--port=80"]
# SAU dacă folosești gunicorn:
# CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]
