+++
title = "用 Pass 管理密码"
author = ["Ernest Dong"]
date = 2021-07-03
tags = ["fun"]
draft = false
+++

pass for macOS usage
<!--more-->


## Pass 的优点 {#pass-的优点}

-   [pass](https://www.passwordstore.org/) 是符合 unix 哲学的密码管理器，利用 gpg 本地加密存储，让人感觉比依靠互联网账号的密码管理器安全。
-   和浏览器完美，利用[browserpass](https://github.com/browserpass/browserpass-extension)可以自动填充
-   iOS 系统上有 [pass for iOS](https://github.com/mssun/passforios)，相当于免费的 1Password
-   [doom emacs](https://github.com/hlissner/doom-emacs) 中有现成的 `:tool pass` 可以使用

遗憾的是 pass 需要一点点配置


## 安装 `Pass` 与 `browserpass` {#安装-pass-与-browserpass}

```shell
brew tap amar1729/formulae # browserpass tap
brew install pass browserpass
```

之后根据 caveats

```shell
PREFIX='/usr/local/opt/browserpass' make hosts-BROWSER-user -f '/usr/local/opt/browserpass/lib/browserpass/Makefile'
```

其中 `BROWSER` 可以是 chromium chrome vivaldi brave firefox 这几种浏览器 ~~(Safari 连 `endnote click` 都没有，除了轻快好难用)~~


## 配置 `Pass` {#配置-pass}


### Pass init {#pass-init}

`Pass` 可以说是一套工具的集合，其中的 GnuPG 就是用来加密的。

```shell
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG
# sec   some-text/your-keys time-today [SC]
pass init "your-keys here!"
```

从此 `$HOME` 下的 `.passwordstore` & `.gnupg` 就不能删了


### Pass 导入 {#pass-导入}

把 Chrome ~~等+（ +万恶的~~ Google 全家桶太好用了不得不用 Chrome）密码导出后可以用这段[gist](https://gist.github.com/ErnestDong/0fc61d76777770a03ffc5bdfda2a5b17)的 python 代码（参考自 [pass](https://www.passwordstore.org/) 官网）转换为 pass 的格式

用这段 gist 导出后 pass 是这样存储的：

```shell
tree
# --example.com
#  |-username.gpg
```

其中的 `username.gpg` 解密后是这样的

```text
a Strong Password
user: username
```


### Pass 使用 {#pass-使用}

```shell
pass list # 展示.passwordstore目录树
pass insert # see below 插入已有的
... # 用emacs 所以不记这些了
```

详细可以看[archwiki](https://wiki.archlinux.org/title/Pass)


### Tweaks {#tweaks}


#### 用 git 同步 {#用-git-同步}

```shell
pass git init
```

这样每次加入密码都会 commit 并且可以同步。 用 pass for iOS 时需要 git 同步。不过 PGP 加密毕竟不是水货。


#### git hook {#git-hook}

每次 commit 后自动 push 到 GitHub 上。

```shell
echo "git push -u origin main" >> .git/hooks/post-commit
chmod u+x .git/hooks/post-commit
```


#### mac 的 browser pass {#mac-的-browser-pass}

```shell
echo "pinentry-program /usr/local/bin/pinentry-mac
" >> ~/.gnupg/gnupg.conf
```

然后可以在对应的网站用 `command + L` 自动输入密码了。


## 配置 `Pass for iOS` {#配置-pass-for-ios}

记得在“系统设置-密码”里填充来源加上 pass，就可以享受免费的 1password 了
