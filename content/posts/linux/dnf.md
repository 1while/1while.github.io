---
title: "Dnf"
date: 2022-06-13T22:44:38+08:00
draft: true
---

# 常用命令
```bash
# 查看版本
dnf –version

# 列出所有dnf命令及用途
dnf help

# 列出指定命令的用途
dnf help clean

# 查看dnf命令执行历史
dnf history

# 查看系统中可用的DNF软件库
dnf repolist

# 查看可用的不可用的所有软件库
dnf repolist all

# 列出系统中所有软件库的可用软件包,以及已经安装的软件包(会联网更新软件库软件包列表)
dnf list

# 列出所有可用软件库中可供安装的软件包
dnf list available

# 列出已安装的RPM包
dnf list installed

# 查看软件包提供者信息
dnf provides /bin/bash

# 查看软件包详情
dnf info nano

# 安装软件包
dnf install nano

# 检查软件包更新
dnf check-update

# 升级所有软件包
dnf update

# 更新指定软件包
dnf update google-chrome

# 删除软件包
dnf remove nano

# 自动删除没有被依赖的孤立软件包
dnf autoremove

# 删除使用dnf过程中残留的过时文件和未完成的编译工程
dnf clean all

# 查看所有软件包组
dnf grouplist

# 安装一个软件包组
dnf groupinstall ‘Educational Software’

# 升级一个软件包组
dnf groupupdate ‘Educational Software’

# 删除一个软件包组
dnf groupremove ‘Educational Software’

# 将所有软件包更新到最新的稳定版
dnf distro-sync

# 重新安装指定软件包
dnf reinstall nano
```

# 添加代理
```bash
$ sudo vim /etc/dnf/dnf.conf
[main]
proxy=http://127.0.0.1:7890
```