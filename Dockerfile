FROM python:3.10-slim
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Use the $PORT env var that Heroku will set
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "connection:app"]
