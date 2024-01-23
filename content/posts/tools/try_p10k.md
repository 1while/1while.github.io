---
title: "ohmyzsh安装powerlevel10k主题"
date: 2022-02-08T22:58:37+08:00
# bookComments: false
# bookSearchExclude: false
categories:
- tools
tags: 
- tools
---


# ohmyzsh 安装p10k主题

## 1. 下载仓库
```bash
git clone --depth=1 git@github.com:romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## 2. 设置主题
```bash
$ vi ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
```

## 3. 重新加载配置生效
```bash
$ source ~/.zshrc
```

## 4. 加载完配置后默认会自动执行一次个性配置引导
```bash
# 手动执行引导
$ p10k configure
```


# 推荐字体安装

## nerd
* https://github.com/ryanoasis/nerd-fonts
```bash
git clone --depth=1 git@github.com:ryanoasis/nerd-fonts.git
./install
```


# 参考
[powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)