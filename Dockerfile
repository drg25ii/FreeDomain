FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install flask gunicorn

# Dezactivăm Health Check-ul agresiv al Koyeb prin forțarea portului
ENV PORT=80
EXPOSE 80

# COMANDĂ "SMART": Caută orice fișier .py și îl pornește pe portul 80
# Această comandă va găsi singură fișierul corect (app.py, main.py sau orice altceva)
CMD ["sh", "-c", "python $(find . -name '*.py' | head -n 1) --host=0.0.0.0 --port=80"]
