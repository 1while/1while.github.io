---
title: "Try systemctl"
date: 2022-03-21T22:38:27+08:00
draft: true
---

# Systemd目录（目录有优先级，三个目录中有同名文件时只取最高优先级的目录）
1. /etc/systemd/system：系统或用户自定义的配置文件
2. /run/systemd/system：软件运行时生成的配置文件
3. /usr/lib/systemd/system：系统或第三方软件安装时添加的配置文件。


# unit管理
```bash
# 重新加载服务
sudo systemctl daemon-reload
# 激活服务并设置为开机启动
sudo systemctl enable clashd
# 启动服务
sudo systemctl start clashd
# 关闭服务
sudo systemctl status clashd
```


# 参考
* [可能是史上最全面易懂的 Systemd 服务管理教程！](https://cloud.tencent.com/developer/article/1516125)
* [Linux Systemd 详细介绍: Unit、Unit File、Systemctl、Target ](https://www.cnblogs.com/usmile/p/13065594.html)
* [Systemd 入门教程：实战篇](https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html)