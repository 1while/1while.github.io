---
title: "Try hugo"
author: "周末💤"
description: "first blog on hugo"
date: 2022-01-12T23:59:49+08:00
lastmod: 2022-01-07
draft: false
categories:
- try
tags: 
- hugo
katex: true
---



# Install
```bash
# MacOS
brew install hugo

# Fedora
dnf install hugo
```

# latest release
* https://github.com/gohugoio/hugo/releases
```bash
# for macos
wget https://github.com/gohugoio/hugo/releases/download/v0.93.2/hugo_extended_0.93.2_macOS-64bit.tar.gz

# for linux
wget https://github.com/gohugoio/hugo/releases/download/v0.93.2/hugo_extended_0.93.2_Linux-64bit.tar.gz

# 解压
tar -zxvf hugo_extended_0.93.2_macOS-64bit.tar.gz
tar -zxvf hugo_extended_0.93.2_Linux-64bit.tar.gz

# 创建软连接
ln -s /Users/zhou/Documents/app/hugo0.93.2/hugo /usr/local/bin/hugo

# 确认软连接
which hugo

# 查看版本
hugo version
```



# Theme
```bash
# try hogo-book theme
git submodule add git@github.com:alex-shpak/hugo-book themes/hugo-book
cp -R themes/hugo-book/exampleSite/content .

# run with -D draft enabled, --theme theme specified, -p port specified
hugo server --minify -D --theme hugo-book -p 1314
```

# new site
```bash
# init a new site
hugo new site myblog

# add a theme
git submodule add git@github.com:WingLim/hugo-tania themes/hugo-tania

# update the theme to config.toml
theme = "hugo-tania"

# run
hugo server --minify -D 

# first page
hugo new posts/my-first-post.md

# about page
hugo new about.md
```

# katex
```latex
Inline math: $ \varphi = \dfrac{1+\sqrt5}{2}= 1.6180339887… $
```

Inline math: $ \varphi = \dfrac{1+\sqrt5}{2}= 1.6180339887… $

```latex
Block math:

$$ \varphi = 1+\frac{1} {1+\frac{1} {1+\frac{1} {1+\cdots} } } $$
```

Block math:

$$ \varphi = 1+\frac{1} {1+\frac{1} {1+\frac{1} {1+\cdots} } } $$