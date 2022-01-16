+++
title = "The macroeconomic uncertainty premium in the corporate bond market"
author = ["Ernest Dong"]
lastmod = 2022-01-16T20:23:38+08:00
tags = ["货币政策", "thesis"]
draft = false
+++

[The macroeconomic uncertainty premium in the corporate bond market](https://www.cambridge.org/core/journals/journal-of-financial-and-quantitative-analysis/article/macroeconomic-uncertainty-premium-in-the-corporate-bond-market/AFE59386DA73CF237E36D168D090CD58)


## 主题 {#主题}

宏观经济不确定性在公司债券横截面中的作用，发现投资级债券(每月0.40%)和非投资级债券(每月0.81%)都存在显著的不确定性溢价。


## 数据 {#数据}

宏观经济不确定性：Jurado, Ludvigson, and Ng (<a href="#citeproc_bib_item_1">2015</a>)提出的宏观经济不确定性指标：大量经济指标中不可预测成分的条件波动率。他们选择了一套丰富的时间序列，代表宏观经济活动的广泛类别：实际产出和收入、就业和工时、实际零售、制造和贸易销售、消费者支出、住房开工、库存和库存销售比、订单和未完成订单、薪酬和劳动力成本、产能利用指标、价格指数、债券和股市指数，以及外汇衡量标准。他们估计每个序列未来价值中不可预测部分的条件波动率，然后将单个条件波动率聚合成一个宏观不确定性指数。

研究债券对宏观不确定性的 \\(\beta\\)（uncertainty beta），为负风险更高，为正可以作为对冲工具。

VIX 作为预期未来市场波动率的代理

betas: the bond market beta, the default beta, the term beta, and the equity-market-volatility beta

控制变量包括债券级别的非流动性、信用评级、到期年限、未偿还债券金额(规模)和1个月的滞后债券回报。


## 分析方法 {#分析方法}

将 Uncertainty Beta 和若干 factor 进行回归，其系数显著，说明其代表的含义没有被通常的因子所包括

将债券的&beta;<sup>UNC</sup> 和股票的比较，相关性只有8%，表明公司债券不确定性溢价不只是股权不确定性溢价的一种表现。

因为在实践中，股票和债券吸引的客户不同。公司债券主要由机构投资者持有，而散户投资者则是股票客户的主要组成部分。有理由认为，机构投资者比散户投资者拥有不同和更好的信息，机构投资者的风险厌恶程度低于散户投资者，这表明两个市场的信息集合和偏好存在异质性。此外，做空成本和流动性水平在这两个资产类别之间差别很大，暗示套利摩擦


## 模型 {#模型}

\\(R\_{i,t+1}=\lambda\_0+\lambda\_{1,t}\beta^{UNC}+\lambda\_{2,t}\beta^{MKT}+\lambda\_{3,t}\beta^{DEF}+\lambda\_{4,t}\beta^{TERM}+\lambda\_{5,t}\beta^{VIX}+\lambda Controls\\)


## 结论 {#结论}

公司债券市场在经济上和统计上都存在显著的不确定性溢价：IG债券每月0.40%，NIG债券每月0.81%。

随着逐步剔除降级债券，经济不确定性溢价下降，这表明溢价代表着信用和宏观经济风险较高的债券要求的回报增加。

不同股票和债券的经济不确定性溢价是不同的，这与主要参与者不平等(散户投资者)和债券(机构投资者)的风险规避水平不同是一致的。

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Jurado, Kyle, Sydney C Ludvigson, and Serena Ng. 2015. “Measuring Uncertainty.” <i>American Economic Review</i> 105 (3): 1177–1216.</div>
</div>