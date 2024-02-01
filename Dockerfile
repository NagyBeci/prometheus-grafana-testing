# Use an official Python runtime as a base image
FROM python:3.13.0a3-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY src/system_usage.py .
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run system_usage.py when the container launches
CMD ["python", "./system_usage.py"]
