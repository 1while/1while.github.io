---
title: "Glados 自动签到"
date: 2022-04-18T21:47:33+08:00
draft: true
---


# 自动签到脚本
```bash
curl -s -k \
-H "Accept: application/json, text/plain, */*" \
-H "Content-Type: application/json;charset=utf-8" \
-H "cookie: _ga=GA1.2.58942149.1646152313; koa:sess=eyJ1c2VySWQiOjEzNzQ0MCwiX2V4cGlyZSI6MTY3MjA3MjUwNTUyNSwiX21heEFnZSI6MjU5MjAwMDAwMDB9; koa:sess.sig=9RyyYB5hrzso_s42mjOAlVcXQAI; _gid=GA1.2.1761327286.1649942988; _gat_gtag_UA_104464600_2=1" \
-d '{"token":"glados_network"}' \
-X POST https://glados.rocks/api/user/checkin
```


# 自动签到服务
```bash
$ sudo vi /etc/systemd/system/checkind.service

[Unit]
Description=glados checkin service
After=multi-user.target

[Service]
Type=simple
RemainAfterExit=true
ExecStart=/home/buzz/data/git/glados_checkin/checkin.sh
Restart=on-failure
TimeoutStartSec=3
TimeoutStopSec=1

[Install]
WantedBy=default.target
```


## 服务控制
```
# 重新加载服务
sudo systemctl daemon-reload
# 开机启动
sudo systemctl enable checkind
# 启动服务
sudo systemctl start checkind
sudo systemctl restart checkind
# 服务状态
sudo systemctl status checkind
```

# shortcut
```bash
$ vi ~/.zshrc
alias cc='sudo systemctl restart checkind && sleep 2s && sudo systemctl status checkind'
```