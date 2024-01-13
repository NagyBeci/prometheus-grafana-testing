# Prometheus-Grafana System Monitoring Tool

## Overview
Welcome to the Prometheus-Grafana System Monitoring Tool! This innovative tool is your one-stop solution for real-time monitoring of your computer's vital metrics. Leveraging the power of Python, Prometheus, and Grafana, it offers a comprehensive view of your system's performance, including CPU, GPU, memory, and network usage. Perfect for system administrators, performance enthusiasts, or anyone curious about what's happening under their system's hood!

## Features
- **CPU Usage Monitoring**: Get accurate readings of your CPU's utilization.
- **Memory Usage Insights**: Keep an eye on how much memory your system is using.
- **GPU Performance Tracking**: Especially useful for those with dedicated graphics cards, monitor your GPU's workload.
- **Network Activity**: Track data sent and received over your network.

## How It Works
The `system_usage.py` script collects various system metrics. These metrics are then exposed via a Prometheus-compatible endpoint, ready for scraping. Prometheus collects and stores this data, allowing Grafana to present it in a series of elegant, easy-to-understand dashboards.

## Quick Start

**Run Setup.sh for fast execution** 
Open a Terminal and navigate to the directory where setup.sh is saved.
Give execute permissions to the script:

bash
chmod +x setup.sh

bash
./setup.sh


**Clone the Repository**:
```   bash
   git clone https://github.com/NagyBeci/Prometheus-Grafna-Testing

Install Dependencies:
Navigate to the cloned directory and install necessary Python packages:

bash:
pip install -r requirements.txt

Run the Monitoring Script:
bash:
python src/system_usage.py

Configure Prometheus:
Download Prometheus at "https://prometheus.io/download/" to monitor applications, webpages and more ...
Update your prometheus.yml bith in your Prometheus Library and in your system monitoring config file to scrape data from this tool.

Visualize with Grafana:
Connect to Grafana with "docker run -d -p 3000:3000 grafana/grafana"
Connect Grafana to Prometheus through "http://host.docker.internal:9090". 
Update Our Grafana will be running through docker and will be monitoring a locally ran Python Program "system_usage.py".
Credentials are "admin ; admin" click Skip, it runs locally anyway.

Contributing
Contributions, issues, and feature requests are welcome! Feel free to check issues page.
Contribute with Pull Requests.

```
