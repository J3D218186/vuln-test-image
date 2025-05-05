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



FROM alpine:3.19

# Install python, pip, venv — tanpa zlib-dev, tanpa glibc
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-virtualenv

# Create venv
WORKDIR /app
COPY requirements.txt .

RUN python3 -m venv /venv && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt 
#    && \
#    /venv/bin/pip install --upgrade setuptools==65.5.1

# Final command
CMD ["/venv/bin/python", "-c", "import flask; print('Flask version:', flask.__version__)"]



