+++
title = "Doom Emacs 写论文的小 tweak"
author = ["Ernest Dong"]
date = 2021-12-30
tags = ["fun"]
draft = false
+++

最近开始写本科毕业论文，老师让我先读文献。读文献的时候找到一些小 tweak 分享出来。

emacs = jabref + onenote + tex studio


## 和学术搜索集成 {#和学术搜索集成}

org-ref 有回车然后可以搜索这篇文章在 Google Scholar/web of science 这样的功能。切换到 vertico、用 org-mode 的 cite 之后 org-ref 显得有些重了，我想到了 doom 的 lookup 功能。

```emacs-lisp
(setq! +lookup-provider-url-alist
      '(
        ("Google" +lookup--online-backend-google "https://google.com/search?q=%s")
        ("DevDocs.io" "https://devdocs.io/#q=%s")
        ("Google Scholar" "https://scholar.google.com/scholar?q=%s")
        ("Xueshu" "https://xueshu.baidu.com/s?wd=%s")
        ("Github" "https://github.com/search?ref=simplesearch&q=%s")))
```

这样用 K 就在这些学术搜索网站上搜到相应论文，下载后在 bibtex entry 中添加文件路径（利用 embark）

![K](https://emacs-china.org/uploads/default/original/3X/4/a/4addd520ac2a63063c00f60b5dbdeba61fb94a3e.png)


## org-roam-bibtex {#org-roam-bibtex}

每周跟老师汇报读文献进展，用 org-roam-bibtex 配合 org-roam 做摘要，显得比老师给的用 excel 好看些（Intel Mac excel 太卡了，还容易崩溃）。分类是老师给我的示例做的，配合 org-cite 而非 org-ref。

```emacs-lisp
(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq! orb-process-file-keyword t
         orb-citekey-format "@%s"
         orb-roam-ref-format 'org-cite
         orb-insert-generic-candidates-format 'entry
         orb-file-field-extensions '("pdf"))
  (add-to-list 'org-roam-capture-templates
               '("b" "Bibliography note" plain
                 "%?"
                 :target (file+head "thesis/${citekey}.org" ":PROPERTIES:
:ROAM_REFS: @${citekey}
:END:
#+TITLE: ${title}\n
#+filetags: :thesis:
#+bibliography: ../reference.bib
[[${file}${url}][${title}]]
\* 主题
\* 数据
\* 分析方法
\* 模型
\* 结论")
                 :unnarrowed t)))
```

第一行是文献的链接，方便查看

![example](https://emacs-china.org/uploads/default/optimized/3X/8/0/806d478a0db9daf90b7e9cf07542df8efcded0a1_2_1380x862.png)


## all-the-icons-completion {#all-the-icons-completion}

all-the-icons-completion 增加类似 all-the-icons-ivy-rich 的 icon

```emacs-lisp
(after! all-the-icons-completion)
(defun all-the-icons-completion-get-icon (cand cat)
  "Return the icon for the candidate CAND of completion category CAT."
  (cl-case cat
    (file (all-the-icons-completion-get-file-icon cand))
    (project-file (all-the-icons-completion-get-file-icon cand))
    (buffer (all-the-icons-completion-get-buffer-icon cand))
    (command (concat (all-the-icons-octicon "gear":height 0.9 :v-adjust -0.05) " "))
    (org-roam-node (concat (all-the-icons-octicon "database":height 0.9 :v-adjust -0.05) " "))
    (t "")))
```

![example](https://emacs-china.org/uploads/default/original/3X/8/8/88e62c52a5894a0348d34638860d656aef4fba3f.png)


## 复制 PDF 之后粘贴去掉空格 {#复制-pdf-之后粘贴去掉空格}

```elisp
 (defun erase-space-in-line()
  "Clear space in line after copy"
  (interactive)
  (setq buf (s-replace " " "" (thing-at-point 'line)))
  (kill-whole-line)
  (insert buf))
```


## deft with pinyin {#deft-with-pinyin}

用拼音搜索 `deft`

```emacs-lisp
(after! deft
  (setq deft-incremental-search nil)
  (defun deft-search-forward (str)
    "Function to use when matching files against filter strings STR.
This function calls `search-forward' when `deft-incremental-search'
is non-nil and `re-search-forward' otherwise."
    (let ((case-fold-search deft-case-fold-search))
      (if deft-incremental-search
          (search-forward str nil t)
        (re-search-forward (pinyinlib-build-regexp-string str) nil t)))))
```
