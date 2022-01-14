+++
title = "How news and its context drive risk and returns around the world"
author = ["Ernest Dong"]
lastmod = 2022-01-14T14:57:26+08:00
tags = ["thesis"]
draft = false
+++

[How news and its context drive risk and returns around the world](https://www.sciencedirect.com/science/article/pii/S0304405X18303180)


## 主题 {#主题}

> 新力控股重债压身，投资者关系管理没有做好，谣言四起加速其最后违约，股票一天暴跌 90%


## 数据 {#数据}

结合了三种类型的数据——市场、宏观和新闻

市场数据包括提前一个月的回报、提前一年的回报、每月波动率和提前一年的回撤。

宏观数据，例如利率、GDP 增长率和信贷比率。

文本数据源是汤森路透机器可读新闻档案。该档案包括 1996 年至 2015 年的所有路透社新闻文章，仅使用英文新闻。


## 分析方法 {#分析方法}

利用 Word2Vec 的思想获得出现频率最高的词，新兴市场是市场 ( Mkt )、政府 ( Govt )、商品 ( Comms )、公司治理 ( Corp ) 以及宏观经济 ( Macro )，发达市场的宏观经济变成了信贷 ( Credit )


## 模型 {#模型}

Word2Vec 的文本识别模型


## 结论 {#结论}

文本流度量中包含的新闻预测了一年前的回报和回撤。对这一发现的一种解释是，词流捕捉到了新闻的“集体无意识”方面，这些方面在文章出现时并不被理解，但捕捉到了随着时间的推移越来越相关的市场影响。

主题领域的主成分分析表明，在全球金融危机爆发期间，系数值可能发生变化。我们将 2007 年 2 月的样本期一分为二，以考虑到这一变化，我们发现各种词流测量的系数值确实会随着时间而变化。

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
</div>