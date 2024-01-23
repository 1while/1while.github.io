---
title: "Try homebrew"
date: 2022-03-02T23:39:47+08:00
draft: true
categories:
- tools
tags: 
- tools
---

# mac homebrew常用配置

## 使用腾讯更新源
```bash
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles' >> ~/.zshrc
source ~/.zshrc
```

## nodejs安装
```bash
brew install nodejs
```

## 参考
> [Homebrew-bottles 镜像使用帮助](https://mirrors.cloud.tencent.com/help/homebrew-bottles.html)