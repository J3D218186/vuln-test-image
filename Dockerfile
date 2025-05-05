# Start from a clean, minimal base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements with a known vulnerable package
COPY requirements.txt .

# Install vulnerable dependency
RUN pip install --no-cache-dir -r requirements.txt

# Dummy command
CMD ["python3", "-c", "import flask; print('Flask version:', flask.__version__)"]
