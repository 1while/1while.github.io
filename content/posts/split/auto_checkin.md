---
title: "Glados 自动签到"
date: 2022-04-18T21:47:33+08:00
draft: true
---


# 自动签到脚本
```checkin.sh
#!/usr/bin/bash
checkin_cookies=$(cat Cookies)
checkin_folder=$(dirname $0)
checkin_success_msg='Please Try Tomorrow'
checkin_file=$checkin_folder/$checkin_success_msg
checkin_cookies=$(cat "$checkin_folder/Cookies")

# 判断是否已经签到
if [ -f "${checkin_file}" ]; then

		# 存在签到文件,判断签到日期
		date_today=$(date -I)
		date_modify=`date -I -d @$(stat -c %Y "$checkin_file")`

		if [ "$date_today" = "$date_modify" ]; then
			# 日期相等判断内容
			msg=`cat "$checkin_file" | jq -r .message`
			if [ "$msg" = "$checkin_success_msg" ]; then
				echo $msg
				exit 0
			fi
		fi
fi

# 签到
curl -s -k \
-H "Accept: application/json, text/plain, */*" \
-H "Content-Type: application/json;charset=utf-8" \
-H "cookie: $checkin_cookies" \
-d '{"token":"glados_network"}' \
-X POST https://glados.rocks/api/user/checkin > "$checkin_file"

msg=`cat "$checkin_file" | jq -r .message`
echo $msg
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