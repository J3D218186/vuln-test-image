# # Start from a clean, minimal base image
# FROM python:3.11-alpine

# # Set working directory
# WORKDIR /app

# # Copy requirements with a known vulnerable package
# COPY requirements.txt .

# # Install vulnerable dependency
# RUN pip install --no-cache-dir -r requirements.txt

# # Dummy command
# CMD ["python3", "-c", "import flask; print('Flask version:', flask.__version__)"]



FROM debian:bookworm-slim

WORKDIR /app

# Install Python, pip, dan venv
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt
COPY requirements.txt .

# Buat virtual environment dan install dependensi di dalamnya
RUN python3 -m venv /venv && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt

# Gunakan interpreter dari venv
CMD ["/venv/bin/python", "-c", "import flask; print('Flask version:', flask.__version__)"]


