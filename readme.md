

# Local Service
```
jekyll serve
```

# Publish
```
jekyll build
cd _site
git add -A
git commit -m "publish"
git push -u origin master
cd ..
```


# _config.yml
## Aux links
![](/assets/images/docs/aux_link.png)
```
# Aux links for the upper right navigation
aux_links:
  "Just the Docs on GitHub":
    - "//github.com/just-the-docs/just-the-docs"

# Makes Aux links open in a new tab. Default is false
aux_links_new_tab: false
```


# 更换主题
```
# Gemfile中增加主题包
gem "just-the-docs"

# 安装
bundle install
```

# 问题记录
## 1. Could not find gem 'minima (~> 2.5)' in locally installed gems.
```
D:\git\jekyll_blog>jekyll serve
D:/app/Ruby33-x64/lib/ruby/gems/3.3.0/gems/bundler-2.5.4/lib/bundler/resolver.rb:332:in `raise_not_found!': Could not find gem 'minima (~> 2.5)' in locally installed gems. (Bundler::GemNotFound)
```

### 题解：
执行`bundle install`安装缺失的minima主题即可

## 2. syntax error (line 256): Variable '{{1,1,0}' was not properly terminated with regexp
```
       Jekyll Feed: Generating feed for posts
  Liquid Exception: Liquid syntax error (line 256): Variable '{{1,1,0}' was not properly terminated with regexp: /\}\}/ in docs/Other/LeetCode/001union_find.md
D:/app/Ruby33-x64/lib/ruby/gems/3.3.0/gems/liquid-4.0.4/lib/liquid/block_body.rb:136:in `raise_missing_variable_terminator': Liquid syntax error (line 256): Variable '{{1,1,0}' was not properly terminated with regexp: /\}\}/ (Liquid::SyntaxError)
```

### 题解：
jekyll的代码解析工具无法正确识别下面的c++语法导致解析错误
```cpp
isConnected = {{1,0,0},{0,1,0},{0,0,1}};
```

换一种写法就可以了
```cpp
isConnected = {
    {1,0,0},
    {0,1,0},
    {0,0,1}};
```

# 参考
* https://jekyllcn.com/
* https://just-the-docs.com/