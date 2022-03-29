---
title: "Contribute to golang"
date: 2022-03-21T13:52:11+08:00
draft: true
---


# install go
```
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
```

## 签署Golang CLA（Contributor License Agreement）
https://developers.google.com/open-source/cla/individual

## Generate Password
https://go.googlesource.com/


## 安装Golang Code Review
```bash
# -u update, update & install
go get -u golang.org/x/review/git-codereview

# 验证
git-codereview help

# -s --no-messages 不显示错误信息
# -r --recursive 递归搜索
# -n --line-number 显示行号
# --binary-files=without-match 排除二进制文件
# --exclude-dir 排除制定目录
# --include=*.{h,cc}
grep -srn --binary-files=without-match --exclude-dir={go,git} "GOPATH=" ~/
```

## 下载代码
```bash
git clone https://go.googlesource.com/go
cd go/src
/all.bash # 执行测试
```



# 参考
* https://www.ixiqin.com/2021/08/21/how-to-become-golang-contributors/
* https://pkg.go.dev/golang.org/x/review/git-codereview