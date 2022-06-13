---
title: "SElinux"
date: 2022-05-30T23:11:35+08:00
draft: true
---

# SELinux(Security-Enhanced Linux)

> SELinux是强制访问控制MAC的一种实现

```bash
# 查看文件的安全上下文信息
ls -Z <filename>

# 修改上下文
chcon 

# 恢复上下文
restorecon 

# 查看状态
sestatus -v

# 查看所有用户安全上下文
sudo semanage user -l

```



# 参考
* http://ipcmen.com/restorecon
* https://www.lxlinux.net/6089.html
* https://baike.baidu.com/item/SELinux/8865268?fr=aladdin