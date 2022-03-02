---
title: "Try gitbook"
date: 2022-02-08T22:58:37+08:00
---

# gitbook常用配置


# 安装gitbook
## 1. 安装nodejs
```bash
# for fedora
sudo dnf install nodejs -y

# for mac
brew install nodejs 
```

## 2. 安装gitbook-cli
```bash
# 使用淘宝更新源
sudo npm config set registry=http://registry.npm.taobao.org -g

# 或者使用腾讯更新源
npm config set registry http://mirrors.cloud.tencent.com/npm

# 安装
sudo npm install -g gitbook-cli
```

## 3. 查看gitbook版本并安装gitbook
```bash
gitbook -V
```

## nodejs版本太新导致的问题
```bash
gitbook -V
CLI version: 2.3.2
Installing GitBook 3.2.3
/usr/local/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287
      if (cb) cb.apply(this, arguments)
                 ^

TypeError: cb.apply is not a function
    at /usr/local/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287:18
    at FSReqCallback.oncomplete (fs.js:184:5)
```

## 安装旧版本nodejs, 重新安装gitbook
### 1. 在已经安装nodejs的前提下, 安装n
```bash
sudo npm install -g n
```

### 2. 使用n安装10.24.1版本的nodejs
```bash
sudo n 10.24.1
```

### 3. 再次尝试安装gitbook
```bash
sudo npm config set registry=http://registry.npm.taobao.org -g
gitbook -V
```

### 参考:
* https://nodejs.org/en/download/releases/

# gitbook使用
## 创建书籍
```bash
mkdir mybook && cd mybook
gitbook init
```

## 预览书籍
```bash
# 预览并构建
gitbook serve
```

## 构建书籍
```bash
gitbook build
```

## 书籍导出
```bash
gitbook pdf ./ ./mybook.pdf
gitbook epub ./ ./mybook.epub
gitbook mobi ./ ./mybook.mobi
```

## 通用配置
```json
"title": "book标题",
"author":"book作者",
"description" : "book描述",
"language" : "zh-hans",
"links" : {
    "sidebar" : {
        "Home" : "https://www.侧边栏链接.com"
    }
}
```


# 插件

## 代码区插件，显示行号和复制功能
1. 根目录创建book.json
2. 写入以下内容
3. 执行gitbook install安装
```json
{ "plugins":["code"] }
```

## 加`-`号禁用插件
```json
{ "plugins":["-code"] }
```

## 回到顶部
```json
{ "plugins":["back-to-top-button"] }
```

## 侧边导航栏宽度可调节插件
```json
{ "plugins":["splitter"] }
```

## 支持emoji表情
```json
{ "plugins":["advanced-emoji"] }
```

## 导航目录折叠，需要目录也有链接存在才能生效
```json
{ "plugins":["chapter-fold"] }
```
* 参考：

```markdown
# Summary

* [Introduction](README.md)
* [chapter1](chapter1.md)
    * [sub chapter1](sub_chapter1.md)
        * [page1](page1.md)
        * [page1](page1.md)
```

## 另外一个目录折叠插件
```json
{ "plugins":["expandable-chapters-small"] }
```

## 高级搜索search-pro，需要禁用默认的search和lunr插件
```json
{
    "plugins": [
          "-lunr",
          "-search",
          "search-pro"
    ]
}
```

## 隐藏元素，比如Published with GitBook按钮
```json
{
    "plugins":[
        "hide-element"
    ],
    "pluginsConfig":{
        "hide-element":{
            "elements": [".gitbook-link"]
        }
    }
}
```



## 参考
[GitBook插件整理](https://www.jianshu.com/p/427b8bb066e6)



