+++
title = "用 ClashX 托管更新不覆盖本地规则"
author = ["Ernest Dong"]
date = 2021-09-25
tags = ["fun"]
draft = false
+++

Clash for macOS usage
<!--more-->


## 托管文件 {#托管文件}

[clashX](https://github.com/yichengchen/clashX) （我用开源版）可以有多个托管配置文件，尽管可以直接编辑 `remote.yaml` ，但是托管更新后自己编辑的规则就被覆盖了


## 解决办法 {#解决办法}

我贴到了[gist](https://gist.github.com/ErnestDong/8b59aad6a332401b3062ab13db3a559f)上

假设 `~/.config/clash/` 是这样的：

```shell
$ exa ~/.config/clash/ -T

/Users/dcy/.config/clash
├── config.yaml
└── remote.yaml
```

copy `config.yaml` 为 `local.yaml` 并添加

```yaml
# proxy provider start here
proxy-providers:
  something-great:
    type: http
    url: your-remote-url
    path: ./remote.yaml
    interval: 36000
    health-check:
      enable: true
      url: http://www.gstatic.com/generate_204
      interval: 3600
# proxy provider end

proxy-groups:
  - name: "your-awesome-name"
    type: select
    use:
      - something-great
rules:
  - "DOMAIN-KEYWORD,google,your-awesome-name"
```

其中 `your-remote-url` 为订阅地址， `rules` 可以复制 `remote.yaml` 的相应部分，然后添加自己的规则，这样就不会被覆盖了
