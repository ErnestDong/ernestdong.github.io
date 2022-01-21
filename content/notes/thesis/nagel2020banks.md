+++
title = "Banks’ risk dynamics and distance to default"
author = ["Ernest Dong"]
lastmod = 2022-01-21T17:59:08+08:00
tags = ["计量模型", "thesis"]
draft = false
+++

[Banks’ risk dynamics and distance to default](/ox-hugo/ContentServer.pdf)


## 主题 {#主题}

典型的银行资产是具有 concave 形收益的高风险债务债权（例如抵押贷款）。由于收益非线性，在借款人资产价值受到负面冲击后，银行资产波动性会上升。

这样的特性导致传统模型显著低估了银行违约风险

这篇文章与 Audrino, Kostrov, and Ortega (<a href="#citeproc_bib_item_1">2019</a>)
一样抨击资产符合对数正态分布的假设


## 数据 {#数据}

美联储 1987 to 2016 的银行数据


## 分析方法 {#分析方法}

-   不是假设总银行资产，而是假设抵押品价值服从对数正态分布，贷款偿还取决于抵押品在贷款到期时的价值

{{< figure src="/ox-hugo/payoffs.png" >}}

因此 Good Times 时违约风险很低，且对贷款人资产不敏感，但也有可能波动率急剧上升，这是传统模型没有想到的

-   抵押品价值不会上升，只能贷款出来抵押品一个固定比例，在银行贷款 rolling 的过程中加剧了收益的不对称性
-   银行资产是对抵押贷款的 short put 期权，银行股权债券又是银行资产的期权


## 模型 {#模型}

扩展 BS 模型，同时假定银行定价是完全竞争的


## 结论 {#结论}

扩展模型更准确，传统模型低估了银行违约风险 2/3 和政府监管的价值

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Audrino, Francesco, Alexander Kostrov, and Juan-Pablo Ortega. 2019. “Predicting Us Bank Failures with Midas Logit Models.” <i>Journal of Financial and Quantitative Analysis</i> 54 (6): 2575–2603. <a href="https://www.cambridge.org/core/journals/journal-of-financial-and-quantitative-analysis/article/predicting-us-bank-failures-with-midas-logit-models/D5158BBB38F736FAF1E16090DED33BBA">https://www.cambridge.org/core/journals/journal-of-financial-and-quantitative-analysis/article/predicting-us-bank-failures-with-midas-logit-models/D5158BBB38F736FAF1E16090DED33BBA</a>.</div>
</div>