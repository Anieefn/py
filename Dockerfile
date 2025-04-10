# ✅ Use a slim Python base image (lightweight)
FROM python:3.12-slim

#  Prevent Python from writing .pyc files & force stdout/stderr to not buffer
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory inside container
WORKDIR /app
COPY . /app/

# Install system dependencies needed for:
# - mysqlclient (needs mysql-dev headers, gcc)
# - razorpay (often needs SSL support)
# - twilio (optional, mostly pip-based)
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    gcc \
    libssl-dev \
    libffi-dev \
 && rm -rf /var/lib/apt/lists/*

# Copy local project files into the container

# Install Python dependencies from requirements.txt
RUN pip install --upgrade pip \
 && pip install --timeout=100 --retries=10 -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

# Expose Django’s default port (used for dev server)
EXPOSE 8000

# Default command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
