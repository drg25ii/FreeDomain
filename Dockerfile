FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install flask gunicorn
ENV PORT=80
EXPOSE 80
WORKDIR /app/opensource/whois_server
CMD ["python", "app.py", "--host=0.0.0.0", "--port=80"]
