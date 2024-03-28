#!/bin/bash
sudo yum update -y
sudo yum install -y python3 python3-pip
pip3 install flask

# Ek yapılandırma veya uygulama başlatma komutları
# Örneğin, bir ortam değişkeni kullanarak sunucu adını ayarlayabilirsiniz:
echo "Server Name: ${myserver}" > /home/ec2-user/server-info.txt
