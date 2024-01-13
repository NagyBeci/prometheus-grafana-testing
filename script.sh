# Clone the GitHub Repository
Write-Host "Cloning the GitHub repository..."
git clone https://github.com/NagyBeci/Prometheus-Grafna-Testing

# Navigate to the Cloned Directory
Set-Location -Path "Prometheus-Grafna-Testing" -ErrorAction Stop

# Install Python Dependencies
Write-Host "Installing Python dependencies..."
pip install -r requirements.txt

# Run the Monitoring Script in the Background
Write-Host "Starting the system_usage.py script..."
Start-Process -NoNewWindow -FilePath python -ArgumentList "src/system_usage.py"

# Instructions for User
Write-Host "Please download and configure Prometheus manually from https://prometheus.io/download/"
Write-Host "Configure your prometheus.yml file to scrape data from localhost:8000."
Write-Host "Run Grafana using Docker with: docker run -d -p 3000:3000 grafana/grafana"
Write-Host "Access Grafana at http://localhost:3000 (default credentials: admin/admin)"
Write-Host "In Grafana, add Prometheus as a data source with URL: http://host.docker.internal:9090"
