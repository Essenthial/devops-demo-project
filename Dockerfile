# 1️⃣ Лёгкий базовый образ
FROM python:3.11-slim

# 2️⃣ Рабочая директория
WORKDIR /app

# 3️⃣ Переменные окружения для Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 4️⃣ Копируем зависимости и устанавливаем их
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5️⃣ Копируем приложение
COPY app/ .

# 6️⃣ Открываем порт
EXPOSE 5000

# 7️⃣ Healthcheck на Python (не нужен curl)
HEALTHCHECK --interval=30s --timeout=3s \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')" || exit 1

# 8️⃣ Команда запуска приложения
CMD ["python", "app.py"]
