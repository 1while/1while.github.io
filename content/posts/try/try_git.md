---
title: Try git
tags: git
date:   2021-05-23 19:00:00 +0800
---


# 下载仓库
``` bash
git clone git@github.com:.../blog.git
```


# 配置默认编辑器为vim
``` bash
git config --global core.editor vim

# --edit 编辑配置
git config -e

# 编辑全局配置
git config --global -e
```


# 配置保存帐号密码
``` bash
git config --global credential.helper store
```


# 显示当前仓库改动状态
``` bash
git status
```


# 改动完成后暂存文件（暂存了才能commit，命令行操作注意路径，git status会显示路径）
``` bash
git add README.md
```


# 一个一个add嫌麻烦，可以一次性全add进去
``` bash
# add modified & new file
git add .

# --update 仅add更新的文件，不会add新文件（untracked files）
git add -u

# add all changes,  modified + untracked + deleted
git add -A
```


# 全add可能会添加到不想加的文件，可以使用.gitignore文件来排除，然后在.gitignore文件中添加排除项
```bash
touch .gitignore
```


# 命令行下其实有交互式的add操作
``` bash
git add -i
```


# add的其它替代方案
* 使用vscode，全程可视化操作，全平台都有安装包


# 提交代码（这么敲会进入vim编辑界面，编辑好退出就可以了）
``` bash
git commit
```


# 提交代码2（-m参数带上了日志信息，直接就提交了）
``` bash
git commit -m "一些日志..."
```


# 更新代码
``` bash
git pull --rebase
```


# 上传代码（注意上传前要先更新）
``` bash
# 向默认关联的远程分支推送
git push

# 向指定远程分支推送
git push -u origin/master
```


# 检出其它分支
``` bash
git checkout -b new_local_branch_name origin/remote_branch_name

# 查看本地分支 local branch
git branch

# 查看本地远程分支 remote-tracking branch
git branch -r

# 查看本地所有分支 local branch & remote-tracking branch
git branch -a

# 重命名本地分支
git branch -m oldname newname

# 删除本地分支
git branch -d local_branch_name

# 强制删除本地分支
git branch -D local_branch_name

# 查看本地分支upstream
git branch -vv

# 设置push/pull默认关联分支 --set-upstream-to
git branch -u origin/master
```


# 查看日志
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


# 设置别名
``` bash
# git log -> git lg
git config --global alias.lg "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) %C(bold green)%as%C(reset) %C(white)%s%C(reset) %C(dim white)%an<%ae>%C(reset)%C(bold yellow)%d%C(reset)' --all"

# git status -> git st
git config --global alias.st status
```


# remote远程地址
``` bash
# 查看所有远程地址
git remote -v

# 修改远程地址
git remote set-url origin git@github.com:.../blog.git

# 重命名
git remote rename origin origin2
```


# 清理目录
``` bash
# -d 清理untracked目录和文件，-f 强制清理
git clean -df
```

# git branch像less一样显示问题
```bash
git config --global paper.branch false
```


# 参考
* [git add](https://git-scm.com/docs/git-add)
* [git log](https://git-scm.com/docs/git-log)