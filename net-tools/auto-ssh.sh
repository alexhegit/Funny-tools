#!/bin/bash

#!/bin/bash

# 定义网段
network="172.16.75.0/24"

# 定义用户名和密码
username="jetson"
password="a"

# 扫描网络并提取IP地址
ips=$(sudo nmap -sn $network | grep "Nmap scan report for" | awk '{print $5}')

# 尝试SSH登录每个IP地址
for ip in $ips; do
    echo "Trying to connect to $ip..."
    sshpass -p "$password" ssh -o StrictHostKeyChecking=no $username@$ip
    if [ $? -eq 0 ]; then
        echo "Successfully connected to $ip"
        break
    else
        echo "Failed to connect to $ip"
    fi
done
