---
title: "Try fedora"
date: 2022-03-02T13:08:17+08:00
draft: true
categories:
- tools
tags: 
- tools
---

# 系统信息
``` bash
# Linux fedora 5.11.12-300.fc34.x86_64
uname -a
```

# 获取管理权限
sudo su root


# 使用中科大更新源
```bash
sed -e 's|^metalink=|#metalink=|g' \
         -e 's|^#baseurl=http://download.example/pub/fedora/linux|baseurl=https://mirrors.ustc.edu.cn/fedora|g' \
         -i.bak \
         /etc/yum.repos.d/fedora.repo \
         /etc/yum.repos.d/fedora-modular.repo \
         /etc/yum.repos.d/fedora-updates.repo \
         /etc/yum.repos.d/fedora-updates-modular.repo

# 恢复
sudo mv fedora.repo fedora.repo.ustc
sudo mv fedora-modular.repo fedora-modular.repo.ustc
sudo mv fedora-updates.repo fedora-updates.repo.ustc
sudo mv fedora-updates-modular.repo fedora-updates-modular.repo.ustc

sudo mv fedora.repo.bak fedora.repo
sudo mv fedora-modular.repo.bak fedora-modular.repo
sudo mv fedora-updates.repo.bak fedora-updates.repo
sudo mv fedora-updates-modular.repo.bak fedora-updates-modular.repo

# 切换更新源后生成缓存
sudo dnf makecache
```

# 使用英文的home目录
1. 切换到英文环境
export LANG=en_US

2. 更新目录名
xdg-user-dirs-gtk-update

3. 切换回中文环境
export LANG=zh_CN.UTF-8

# 安装vim
dnf install vim -y

# 锁住/解锁终端
ctrl+s / ctrl+q

# 查看光驱信息
cat /proc/sys/dev/cdrom/info

# gnome优化工具
dnf install gnome-tweak-tool

# sublime
1. Install the GPG key: 
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

2. Select the channel to use: 
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

3. Update dnf and install Sublime Text 
dnf install sublime-text

* ref:
https://www.sublimetext.com/docs/linux_repositories.html#dnf

# dash to dock 显示gnome任务栏工具
git clone git@github.com:micheleg/dash-to-dock.git
make
make install
reboot


# go环境
dnf install golang golang-docs golang-bin golang-shared

* 添加环境变量 vim ~/.bash_profile
```bash
export GOROOT=/usr/local/go  #设置为go安装的路径，有些安装包会自动设置默认的goroot
export GOPATH=$HOME/gocode   #默认安装包的路径
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```
* 重新加载生效
source ~/.bash_profile

## install vscode
```bash
# install the key and repository:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# install the package using dnf (Fedora 22 and above):
dnf check-update
sudo dnf install code
```