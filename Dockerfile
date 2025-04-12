# Dockerfile (optional simplification)
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


# Create a non-root user
RUN useradd -m appuser
WORKDIR /app

# Only Flask needed for now
RUN pip install --no-cache-dir flask google-cloud-storage


COPY app.py .


# Create a non-root user and use it to run the app
USER appuser

# Copy application code to the container
COPY . /app

# Expose the port
EXPOSE 8080

# Run the app as the non-root user
CMD ["python", "app.py"]

EXPOSE 8081