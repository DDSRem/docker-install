echo "安装常用软件"
apt-get update && apt-get install -y wget vim git nano sudo
echo "开始安装Docker"
wget -qO- get.docker.com | bash
docker -v
echo "Docker安装完成"
echo "Docker版本"
docker -v
echo "设置Docker开机自启"
systemctl enable docker
echo "设置成功"
echo "开始安装docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "docker-compose安装完成"
echo "docker-compose版本"
docker-compose --version
echo "安装Portainer"
docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /root/data/docker_data/portainer/data:/data \
    cr.portainer.io/portainer/portainer-ce
echo "Portainer安装完成"
echo "安装完成，清除脚本"
rm $0
