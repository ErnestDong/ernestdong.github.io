+++
title = "Exploring the sources of default clustering"
author = ["Ernest Dong"]
lastmod = 2022-01-01T19:13:41+08:00
tags = ["thesis"]
draft = false
+++

[Exploring the sources of default clustering](https://www.sciencedirect.com/science/article/pii/S0304405X1830103X)


## 主题 {#主题}

违约聚类的一个主要来源是公司共同暴露于共同或相关的风险因素，如利率、股票收益和 GDP 增长。这些因素的变动导致公司有条件违约率的相关变化。除了公司对系统性因素的共同暴露之外，还有其他违约集群的来源。

公司之间的财务、法律或业务关系可能充当风险分散的渠道。例如，信用互换中保护卖方的违约可能会使买方面临保护，并增加保护买方的其他交易对手承担的违约风险。通过传染，一家公司的违约会对其他公司的有条件违约率产生直接影响(<a href="#citeproc_bib_item_1">Acemoglu, Ozdaglar, and Tahbaz-Salehi 2015</a>)。


## 数据 {#数据}

![美国公司违约数量](/ox-hugo/美国公司违约数量.jpg)

违约定义为(<a href="#citeproc_bib_item_2">Hamilton 2005</a>)

-   利息或本金未支付或延迟支付，包括在宽限期内延迟支付；
-   破产、行政管理、法定接管或其他法律阻碍及时支付利息或本金；
-   在以下情况下发生不良交换：
    -   发行人向债务持有人提供新的证券或一揽子证券，相当于减少的财务义务
    -   交换的明显目的是帮助借款人避免违约。

考虑的变量包括根据最终产品和非工业供应（IP，每月观察）计算的美国工业生产的季度增长率，美国国内生产总值（GDP，每季度观察）的年化季度增长率，尾随标准普尔 500 指数的年度回报（RET，每日观察），标准普尔 500 指数的一年追踪波动率（VOL，每日观察），以三个月国库券收益率的收益率衡量的收益率曲线水平(LEVEL, 每日观察), 以十年期国债与一年期国债的利差衡量的收益率曲线斜率 (SLOPE, 每日观察), 十年期国债收益率 (10Y, 每日观察) )，穆迪的 AAA 公司收益率（AAA，每周观察），穆迪 BAA 和 AAA 公司收益率（CRED，每周观察）之间的信用利差，以及根据 NBER 商业周期日期的衰退指标（REC，每月观察）。


## 分析方法 {#分析方法}

首先确定违约数据中存在 excess clustering 无法通过公司对可观察和潜在系统因素的联合暴露来解释。
企业共同暴露于可观察和潜在的系统风险因素本身并不能解释美国违约时间数据中发现的聚集程度。

接下来测试在控制了公司对可观察和潜在系统因素的联合暴露后，传染是否是违约聚类的重要来源。

最后，测试违约时间数据是否表现出 excess clustering ，而这无法通过公司对可观察和潜在系统风险因素以及失败事件的联合暴露来解释。
存在显著的 excess clustering，不能用公司对可观察和潜在的系统风险因素以及传染的联合暴露来解释。


## 模型 {#模型}

违约强度 =
复杂的数学模型，分成了可观测的 X ，不可观测的符合 Cox-Ingersoll-Ross 的潜在因子 Z ，以及经典自激规范的 Y 。


## 结论 {#结论}

拟合模型捕获了由系统风险因素和传染渠道的影响引起的聚类，几乎完美地匹配了的时间变化结果所隐含的时间变化的违约计数和违约时间的理论分布。这表明在本文中研究的来源无法解释的数据中违约聚类的数量是微不足道的。

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Acemoglu, Daron, Asuman Ozdaglar, and Alireza Tahbaz-Salehi. 2015. “Systemic Risk and Stability in Financial Networks.” <i>American Economic Review</i> 105 (2): 564–608.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_2"></a>Hamilton, David. 2005. “Moodys Senior Ratings Algorithm and Estimated Senior Ratings.” <i>Moodys Investors Service</i>.</div>
</div>
