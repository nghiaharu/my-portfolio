# Sử dụng Python image bản nhẹ nhàng
FROM python:3.11-slim

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy requirements và cài đặt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ mã nguồn vào container
COPY . .

# Mở port 8080
EXPOSE 8080

# Chạy app bằng gunicorn cho môi trường production
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]