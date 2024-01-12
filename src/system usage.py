import psutil
import GPUtil
import time
from prometheus_client import start_http_server, Gauge

# Prometheus metrics
cpu_usage_gauge = Gauge('system_cpu_usage', 'CPU usage of the system')
memory_usage_gauge = Gauge('system_memory_usage', 'Memory usage of the system')
gpu_usage_gauge = Gauge('system_gpu_usage', 'GPU usage of the system')
network_sent_gauge = Gauge('system_network_sent', 'Bytes sent over the network')
network_recv_gauge = Gauge('system_network_recv', 'Bytes received over the network')

def cpu_usage():
    return psutil.cpu_percent()

def memory_usage():
    return psutil.virtual_memory().percent

def gpu_usage():
    gpus = GPUtil.getGPUs()
    if gpus:
        return gpus[0].load * 100
    else:
        return 0  # Return 0 if no GPU found

def network_usage():
    net_io = psutil.net_io_counters()
    return net_io.bytes_sent, net_io.bytes_recv

def update_prometheus_metrics():
    cpu_usage_val = cpu_usage()
    memory_usage_val = memory_usage()
    gpu_usage_val = gpu_usage()
    bytes_sent, bytes_recv = network_usage()

    cpu_usage_gauge.set(cpu_usage_val)
    memory_usage_gauge.set(memory_usage_val)
    gpu_usage_gauge.set(gpu_usage_val)
    network_sent_gauge.set(bytes_sent)
    network_recv_gauge.set(bytes_recv)

if __name__ == '__main__':
    # Start up the server to expose the metrics.
    start_http_server(8000)  # Port number where metrics will be exposed

    while True:
        update_prometheus_metrics()
        print("CPU Usage:", cpu_usage(), "%")
        print("Memory Usage:", memory_usage(), "%")
        print("GPU Usage:", gpu_usage(), "%")
        print("Network Usage: Sent =", network_usage()[0], "bytes, Received =", network_usage()[1], "bytes")
        time.sleep(1)
