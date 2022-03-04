---
title: "linux下压缩解压文件"
date: 2022-03-04T12:34:39+08:00
draft: true
---


# 解压

## .gz文件解压
```bash
# gunzip
gunzip filename.zip

# gzip
gzip -d filename.zip
```

## .tar.gz文件解压
```bash
# tar
tar zxvf filename.tar.gz
```

# 压缩

# 创建.gz压缩文件
```bash
# gzip
gzip filename
```