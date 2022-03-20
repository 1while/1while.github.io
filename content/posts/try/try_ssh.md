---
title: "Try ssh"
date: 2022-03-20T17:18:10+08:00
draft: true
---



# ssh 登录，默认端口22
```bash
ssh -p 22 username@hostname
```

# ssh秘钥
```bash
# 生成秘钥（公钥和私钥）,-C注释，-f秘钥文件名
ssh-keygen -C 'comments' -f keyname

# 拷贝公钥到远程机器
ssh-copy-id -i id_key.pub username@hostname

# 指定端口12345（修改过默认端口为12345）
ssh-copy-id -p 12345 -i id_key.pub username@hostname

```

# ssh执行远程命令
```bash
# 复制公钥到远程机器
ssh user@host 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
```

# ssh config
```bash
Host host1
HostName 192.168.0.123
User username
IdentityFile ~/.ssh/id_private
```

## 通过config中设置的别名登录
```bash
ssh host1
```

# ssh隧道，端口转发
```bash

```