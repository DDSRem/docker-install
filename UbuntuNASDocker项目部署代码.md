# UbuntuNAS Docker项目部署代码

## 1. Docker安装

#### 1. 常用软件安装

```bash
apt-get update && apt-get install -y wget vim git nano sudo
```

#### 2. Docker安装

1. 一键安装脚本

```bash
wget -qO- get.docker.com | bash
```

2. 官方安装方法

```html
https://docs.docker.com/engine/install/
```

3. 版本查看

```bash
docker -v
```

4. 设置开机自启

```bash
systemctl enable docker
```

#### 3.Docker-compose安装

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

查看版本

```bash
docker-compose --version
```

## 2. Portainer安装

```bash
docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /home/暂存/docker/portainer/data:/data \
    cr.portainer.io/portainer/portainer-ce:latest
```

## 3.  Ward安装

```bash
docker run -itd \
  --name ward \
  -p 4001:4001 \
  -e WARD_PORT=4001 \
  -e WARD_THEME=light \
  --privileged=true \
  antonyleons/ward
```

## 4. Uptime-Kuma安装

```bash
mkdir /home/暂存/docker/uptime-kuma
cd /home/暂存/docker/uptime-kuma
nano docker-compose.yml
```

```bash
version: '3.3'
services:
  uptime-kuma:
    image: louislam/uptime-kuma
    container_name: uptime-kuma
    volumes:
      - /home/暂存/docker/uptime-kuma:/app/data
    ports:
      - 3001:3001
```

## 5. resilio-sync安装
``` bash
docker run -d \
  --name=resilio-sync \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -p 8050:8888 \
  -p 55555:55555 \
  -v /home/暂存/docker/resiliosync/config:/config \
  -v /home/下载/resilio-sync备份:/downloads \
  -v /home/暂存/docker/resiliosync/data:/sync \
  --restart unless-stopped \
  linuxserver/resilio-sync
```
## 6. minimalist-web-notepad安装
``` bash
docker run -itd \
  --restart=always \
  --name minimalist-web-notepad \
  -v /home/暂存/docker/minimalist:/var/www/html/_tmp \
  -p 8006:80 \
  ddsderek/minimalist-web-notepad
```

## 7. 青龙面板安装

``` bash
docker run -dit \
  -v /home/暂存/docker/ql/data:/ql/data \
  -p 5700:5700 \
  --name qinglong \
  --hostname qinglong \
  --restart unless-stopped \
  ddsderek/qinglong:latest
```

## 8. h5ai搭建

H5aiFile

``` bash
docker run -d \
-v /home/暂存/docker/h5ai:/srv \
-v /home/暂存/docker/h5aifile/filebrowserconfig.json:/etc/config.json \
-v /home/暂存/docker/h5aifile/database.db:/etc/database.db \
--name h5aifile \
-p 8005:80 \
filebrowser/filebrowser
```

H5ai本体

```bash
docker run -d -p 8002:80 -v /home/暂存/docker/h5ai:/h5ai --name h5ai ilemonrain/h5ai:full
```

## 9. Heimdall安装

```bash
docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 81:80 \
  -e TZ=Asia/Shanghai \
  -v /home/暂存/docker/heimdall/config:/config \
  --restart unless-stopped \
  linuxserver/heimdall
```



