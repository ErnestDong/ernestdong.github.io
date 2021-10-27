+++
title = "A stata scratch"
author = ["Ernest Dong"]
date = 2021-01-01
tags = ["coding"]
draft = false
+++

stata on our own
<!--more-->


## summary {#summary}

这是一个模仿 stata 的 flask 网页应用，可以实现一些基本的 stata 操作，如数据的简单清洗、OLS 回归

**Link [HERE!](https://github.com/ErnestDong/stata%5Fscratch)**


## 目的 {#目的}

stata 安装太麻烦，恰好数算大作业可以自由发挥，于是就有了这个项目


## 可扩展性 {#可扩展性}

开发过程中我考虑到了扩展性，只需要遵循 src 的接口，就可以扩展计量模型


## 简介 {#简介}

通过 flask 展示

****Note**** 可以在 Linux(测试使用的发行版为 Arch)与 macOS 下直接使用


### 依赖 {#依赖}

-   python 3.7.7 or python 3.8.3
-   flask 1.0.2，用于搭建网页后端
-   matplotlib 3.2.1，用于作图
-   numpy 1.18.1，用于数据处理
-   pandas 1.0.3，用于数据处理
-   scipy 1.4.1，用于数据处理
-   statsmodels 0.11.1，用于数据处理
-   seaborn 0.10.1，用于数据处理

测试浏览器：Firefox75.0/76.0/77.0，Safari13.1.1，Microsoft Edge83


### 执行 {#执行}

```shell
python3 app.py
```


## 运行截图 {#运行截图}

![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy/static/pic/readmepic/login.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/upload.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/clean.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/figure.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/matrix1.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/matrix2.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/classic.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/browse.png?raw=true)
![](https://github.com/ErnestDong/stata%5Fscratch/blob/dcy//static/pic/readmepic/ans.png?raw=true)
