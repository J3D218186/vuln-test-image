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



# Base image yang ringan tapi aman
FROM debian:bookworm-slim

# Set metadata
LABEL maintainer="you@example.com"
LABEL description="Python + Flask with minimal surface and no known SQLite CVEs"

# Set working directory
WORKDIR /app

# Install Python and pip (tanpa SQLite tambahan)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .

# Install Flask
RUN pip3 install --no-cache-dir -r requirements.txt

# Dummy command
CMD ["python3", "-c", "import flask; print('Flask version:', flask.__version__)"]

