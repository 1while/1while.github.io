---
title: "Try clash"
date: 2022-03-02T01:39:49+08:00
draft: true
---

# 下载安装
```bash
# download
wget https://github.com/Dreamacro/clash/releases/download/v1.9.0/clash-linux-amd64-v1.9.0.gz

# extract
gunzip clash-linux-amd64-v1.9.0.gz
cd clash-linux-amd64-v1.9.0

# download config
curl https://update.glados-config.com/clash/137440/9039f80/13763/glados.yaml > config.yaml 

# run
clash-linux-amd64-v1.9.0 -d ./

# local clash config
http://clash.razord.top/#/proxies
http://127.0.0.1:9090
```

# 代理配置
```bash
# 全局代理
$ vi /etc/profile
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
export no_proxy="localhost, 127.0.0.1, ::1, 192.168.*.*, 10.*.*.*, *.local, *.taobao.com, *.xiaohongshu.com"

# 应用代理配置
$ source /etc/profile

# 取消终端代理配置
unset http_proxy https_proxy all_proxy
```

## 白名单（没生效）
```
$ vi config.yaml
cfw-bypass:
  - '*.taobao.com'
  - '*.xiaohongshu.com'
```
# 添加启动服务
```
$ sudo vi /etc/systemd/system/clashd.service

[Unit]
Description=Clash service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/clash -f /opt/clash/config.yaml -d /opt/clash/config


[Install]
WantedBy=multi-user.target
```

## 服务控制
```
# 重新加载服务
sudo systemctl daemon-reload
# 开机启动
sudo systemctl enable clashd
# 启动服务
sudo systemctl start clashd
# 关闭服务
sudo systemctl status clashd
```

## 启动服务失败出现Permission denied问题
```bash
# 修改selinux模式为Permissive
sudo setenforce Permissive 
```

# 查看自己的ip信息
```
curl cip.cc
curl ipinfo.io
```

# 参考
* https://glados.one/console/clash
* https://github.com/Dreamacro/clash
* https://github.com/Dreamacro/clash/releases