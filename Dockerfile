# Используем официальный образ Node.js
FROM node:latest

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json для установки зависимостей
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install --only=production

# Копируем остальные файлы приложения
COPY . .

# Экспонируем порт
EXPOSE 8080

# Команда для запуска приложения
CMD ["node", "main.js"]
