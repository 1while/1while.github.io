---
title: "Glados 自动签到"
date: 2022-04-18T21:47:33+08:00
draft: true
---


# 自动签到脚本
```checkin.sh
#!/usr/bin/bash
checkin_folder=$(dirname $0)
checkin_cookies=$(cat "$checkin_folder/Cookies")

# 签到
tmp_file=$(mktemp)
curl -s -k \
-H "Accept: application/json, text/plain, */*" \
-H "Content-Type: application/json;charset=utf-8" \
-H "cookie: $checkin_cookies" \
-d '{"token": "glados.network"}' \
-X POST https://glados.rocks/api/user/checkin > "$tmp_file"

msg=`cat "$tmp_file" | jq -r .message`
echo $msg

rm $tmp_file
```


# 签到服务
```bash
$ sudo vi /etc/systemd/system/checkind.service

[Unit]
Description=glados checkin service

[Service]
ExecStart=/home/buzz/data/git/glados_checkin/checkin.sh
```

# 定时签到服务
```bash
$ sudo vi /etc/systemd/system/checkind.timer

[Unit]
Description=Runs glados checkin every 5min

[Timer]
OnUnitActiveSec=5min
Unit=checkind.service

[Install]
WantedBy=multi-user.target
```


## 服务控制
```bash
# 重新加载服务
sudo systemctl daemon-reload
# 开机启动
sudo systemctl enable checkind.timer
# 关闭开机启动
sudo systemctl disable checkind.timer
# 启动服务
sudo systemctl start checkind.timer
# 服务状态
sudo systemctl status checkind.timer
sudo systemctl status checkind
```

# shortcut
```bash
$ vi ~/.zshrc
alias cc='/home/buzz/data/git/glados_checkin/checkin.sh'
```

# 参考
* [jq, json解析器简介](https://www.cnblogs.com/kevingrace/p/7565371.html)
* [Systemd 定时器教程](http://www.ruanyifeng.com/blog/2018/03/systemd-timer.html)
* [systemd timer：取代cron和at的定时任务](https://www.junmajinlong.com/linux/systemd/systemd_timer/)