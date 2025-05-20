FROM mongo:latest

# MongoDB слушает 27017 по умолчанию, ничего дополнительно указывать не нужно
EXPOSE 27017

# Заглушка для Health Check Render (иначе сервис упадет)
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD mongosh --eval "db.adminCommand('ping')" || exit 1
