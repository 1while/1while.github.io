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

# 查看版本
$ hugo version
Hugo Static Site Generator v0.80.0/extended linux/amd64 BuildDate: unknown
```

# latest release
* https://github.com/gohugoio/hugo/releases
```
wget https://github.com/gohugoio/hugo/releases/download/v0.93.2/hugo_extended_0.93.2_macOS-64bit.tar.gz

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

# Build from source
```bash
git clone git@github.com:gohugoio/hugo.git

mkdir -p src/github.com/gohugoio
ln -sf $(pwd) src/github.com/gohugoio/hugo
go get
go build -o hugo main.go

CGO_ENABLED=1 go install -v --tags extended
# You can run go clean -modcache and then go mod tidy which will re-download all deps with the correct checksum (this updates the pkg cache in $GOPATH/pkg/mod/).

# To update vendor/ folder run: go mod vendor
```

## build error
```bash
$ CGO_ENABLED=1 go install -v --tags extended
go: downloading github.com/dlclark/regexp2 v1.4.0
go: downloading golang.org/x/sys v0.0.0-20220209214540-3681064d5158
go: downloading github.com/pelletier/go-toml/v2 v2.0.0-beta.6
go: downloading github.com/aws/aws-sdk-go v1.43.5
get "golang.org/x/sys": found meta tag vcs.metaImport{Prefix:"golang.org/x/sys", VCS:"git", RepoRoot:"https://go.googlesource.com/sys"} at //golang.org/x/sys?go-get=1
verifying github.com/pelletier/go-toml/v2@v2.0.0-beta.6: checksum mismatch
	downloaded: h1:TA3qh4Cq1VOjh4AJnMHrUFbAsIbD7OnOvpaIRYsU0sI=
	go.sum:     h1:JFNqj2afbbhCqTiyN16D7Tudc/aaDzE2FBDk+VlBQnE=

SECURITY ERROR
This download does NOT match an earlier download recorded in go.sum.
The bits may have been replaced on the origin server, or an attacker may
have intercepted the download attempt.

For more information, see 'go help module-auth'.

```
> fix: 手动修改downloaded中的checksum到go.sum



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