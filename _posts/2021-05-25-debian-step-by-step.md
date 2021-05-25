---
title: Debian step by step
layout: post
author: Theseus
categories: 
tags: debian
date: 2021-05-25 22:00:00 +0800
---

* content
{:toc}


### [oh my zsh](https://ohmyz.sh/)
```
# 安装zsh
sudo apt install zsh

# 下载仓库
* 由于github访问不太稳定直接执行curl/wget很容易失败，这里先把仓库clone下来
git clone git@github.com:ohmyzsh/ohmyzsh.git

# 安装
sh ./tool/install.sh

# 安装自体
sudo apt-get install fonts-powerline

# powerline字体仓库
git@github.com:powerline/fonts.git

# 切换主题
vim ~/.zshrc
ZSH_THEME="agnoster"

# 执行source ~/.zshrc报错，bash: autoload：未找到命令
* 直接在终端执行zsh即可，或者设置默认终端为zsh，或者在~/.bashrc中加入zsh
echo "zsh" >> ~/.bashrc
source ~/.bashrc

# 查看默认的shell
echo $SHELL

# 修改默认的shell，重新登陆生效
chsh -s $(which zsh)
```

# wifi驱动
```
sudo apt install firmware-iwlwifi
sudo reboot
```