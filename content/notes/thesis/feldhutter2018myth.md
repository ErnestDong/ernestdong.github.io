+++
title = "The myth of the credit spread puzzle"
author = ["Ernest Dong"]
lastmod = 2022-01-16T20:21:42+08:00
tags = ["利差", "thesis"]
draft = false
+++

[The myth of the credit spread puzzle](https://academic.oup.com/rfs/article/31/8/2897/4953344?login=true)


## 主题 {#主题}

莫顿模型无法解释实际投资级债券信用利差的水平，存在很大的低估，公司债券的利差大约是违约、税收和流动性不足所能解释的两倍

作者提出的方法可以对投资级违约概率进行更精确和更少偏差的估计


## 数据 {#数据}

包含 256,698 个公司债券收益率与工业公司发行的不可赎回债券掉期利率的差值


## 分析方法 {#分析方法}


### 历史违约率的两个关键点 {#历史违约率的两个关键点}

-   30 年的样本期间，观察到的平均率存在很大的抽样误差：违约是相关的
-   投资级违约率分布高度正偏：大多数情况下，很少违约，但偶尔会看到很多违约


### 违约的定义 {#违约的定义}

违约边界：公司价值/债务面值，小于则违约


### 现有方法 {#现有方法}

从单个事后违约频率中提取事前违约概率，但由于违约频率低和违约相关，大样本估计也存在偏差


## 模型 {#模型}


### 核心假设 {#核心假设}

-   资产动态遵循几何布朗运动，当资产价值第一次低于违约边界时发生违约
-   违约边界的位置（按每家公司的债务面值衡量）在所有公司中都是一个常数。


### 数据优势 {#数据优势}

使用来自广泛评级和期限的已实现累积违约率。
可以汇总的关键假设是具有不同评级和不同期限债券的公司将共享一个共同的违约边界。

由于低信用质量债券更频繁地违约，提供了更多关于违约边界位置的信息

从不同公司评级对获得的违约边界估计不完全相关，因此将它们组合起来是有效的


### 模型 {#模型}

扩展Chen, Collin-Dufresne, and Goldstein (<a href="#citeproc_bib_item_1">2009</a>)拟合 BBB 级债券的模型，使之拟合不同评级不同期限的利差

\\(\underset{\\{d\\}}{\min} \sum\_{a=AAA}^{C}\sum\_{T=1}^{20}\frac{1}{T}\Big|\overline{\pi}^P\_{aT}(d)-\hat{\pi}^P\_{aT}\Big|.\\)

最小化 7 个评级和 20 个期限的利差误差的加权平均值，获得违约边界 \\(d=0.8944\\)。
即当一家公司的(公司)价值低于债务面值的89.44%时，该公司就会违约。


## 结论 {#结论}

提高精度的部分原因是结合了 20 个期限和 7 个评级的信息，并且来自不同评级/期限对的违约概率估计不完全相关。

不支持“信用价差之谜”，所谓的 puzzle 是由于模型的不正确应用产生的

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Chen, Long, Pierre Collin-Dufresne, and Robert S Goldstein. 2009. “On the Relation between the Credit Spread Puzzle and the Equity Premium Puzzle.” <i>The Review of Financial Studies</i> 22 (9): 3367–3409.</div>
</div>