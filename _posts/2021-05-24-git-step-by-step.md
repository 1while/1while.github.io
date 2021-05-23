---
title: Git step by step
layout: post
author: Theseus
categories: 
tags: git
---

* content
{:toc}



### 下载仓库
``` bash
git clone git@github.com:.../blog.git
```

### 配置默认编辑器为vim
``` bash
git config --global core.editor vim

# --edit 编辑配置
git config -e

# 编辑全局配置
git config --global -e
```

### 配置保存帐号密码
``` bash
git config --global credential.helper store
```

### 显示当前仓库改动状态
``` bash
git status
```

### 改动完成后暂存文件（暂存了才能commit，命令行操作注意路径，git status会显示路径）
``` bash
git add README.md
```

### 一个一个add嫌麻烦，可以一次性全add进去
``` bash
# add modified & new file
git add .

# --update 仅add更新的文件，不会add新文件（untracked files）
git add -u

# add all changes,  modified + untracked + deleted
git add -A
```

### 全add可能会添加到不想加的文件，可以使用.gitignore文件来排除，然后在.gitignore文件中添加排除项
```
vim .gitignore
```

### 命令行下其实有交互式的add操作
``` bash
git add -i
```

### add的其它替代方案
* 使用vscode，全程可视化操作，全平台都有安装包


### 提交代码（这么敲会进入vim编辑界面，编辑好退出就可以了）
``` bash
git commit
```

### 提交代码2（-m参数带上了日志信息，直接就提交了）
``` bash
git commit -m "一些日志..."
```

### 更新代码（冲突问题另说）
``` bash
git pull --rebase
```

### 上传代码（注意上传前要先更新）
``` bash
git push
```

### 查看日志
``` bash
# 显示日志
git log
# 最近2个日志
git log -2
# 全部修改
git log -p
# 日志统计
git log --stat --summary 
```

### 设置别名
``` bash
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)&lt;%an&gt;%Creset' --abbrev-commit"  
```

### remote远程地址
``` bash
# 查看所有远程地址
git remote -v

# 修改远程地址
git remote set-url origin git@github.com:.../blog.git

# 重命名
git remote rename origin origin2
```

### 参考
[git add](https://git-scm.com/docs/git-add)