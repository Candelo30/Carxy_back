FROM python:3.11-slim

WORKDIR /app

COPY carxy_backend/ /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["gunicorn", "carxy.wsgi:application", "--bind", "0.0.0.0:8000"]
