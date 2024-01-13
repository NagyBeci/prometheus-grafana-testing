#!/bin/bash

# Clone the GitHub Repository
echo "Cloning the GitHub repository..."
git clone https://github.com/NagyBeci/Prometheus-Grafna-Testing

# Navigate to the Cloned Directory
cd Prometheus-Grafna-Testing || exit

# Install Python Dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Run the Monitoring Script in the Background
echo "Starting the system_usage.py script..."
nohup python src/system_usage.py &

# Instructions for User
echo "Please download and configure Prometheus manually from https://prometheus.io/download/"
echo "Configure your prometheus.yml file to scrape data from localhost:8000."
echo "Run Grafana using Docker with: docker run -d -p 3000:3000 grafana/grafana"
echo "Access Grafana at http://localhost:3000 (default credentials: admin/admin)"
echo "In Grafana, add Prometheus as a data source with URL: http://host.docker.internal:9090"