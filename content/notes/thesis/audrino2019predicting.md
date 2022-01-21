+++
title = "Predicting us bank failures with midas logit models"
author = ["Ernest Dong"]
lastmod = 2022-01-21T17:52:47+08:00
tags = ["计量模型", "thesis"]
draft = false
+++

[Predicting us bank failures with midas logit models](https://www.cambridge.org/core/journals/journal-of-financial-and-quantitative-analysis/article/predicting-us-bank-failures-with-midas-logit-models/D5158BBB38F736FAF1E16090DED33BBA)


## 主题 {#主题}

在 logit 回归中使用  Mixed-data sampling (MIDAS) 修正

过去的文献从 CAMELS 出发研究银行倒闭：

-   capital
-   assets
-   management
-   earnings
-   liquidity
-   sensitivity to market risk

结果不好可以尝试这种方式改进


## 数据 {#数据}

-   Bank Level 50 quarters of data for 9,936 unique banks.
-   525 failure cases


## 分析方法 {#分析方法}

将 MIDAS 加权方案与 Logistic 回归相结合，以提高其预测能力。在6和8个季度的预测水平上，分类精度的提高在统计上是显著的，t 检验、McNemar 检验和 Wilcoxon 检验都有力地支持了这一结论。相较于经典 logit 模型，能够正确预测先前被错误分类的几个重要银行倒闭。


## 模型 {#模型}

logistic 模型在数据分组存在 severe class imbalance 时可能估计不准确

Duca and Peltonen (<a href="#citeproc_bib_item_1">2013</a>) 在选择 logit 模型大于 &mu; 则为 1 时根据在加权的第一类和第二类错误率优化损失函数，这与使用模型与朴素分类相比的收益有关。

样本过度不平衡时也可以选择认为最有可能出风险的 &alpha; 分位数为 Risk Group 计算准确率，作者选择了 5% 。MIDAS LOGIT 模型在 RG 中获得了更好的失效案例分布。

MIDAS 回归作为一种为混频数据集设计的简约模型，放宽了这两个限制：自动选择相关期间，并且每个季度的权重不同。由于这两个约束的动态性都不强，因此 MIDAS 加权可以显著提高模型对数据的拟合程度和预测能力

MIDAS 方法是给不同频率数据加总时赋一个权值 \\(\gamma(j;\theta\_1,\theta\_2)\\) ，j 是滞后期数。


## 结论 {#结论}

缓解了数据中的分类不平衡问题，并调整了分类准确率评估。将所提出的模型应用于 2004-2016 年期间，发现比经典的 logit 模型正确地分类了更多的银行倒闭案例，特别是对于长期预测期。之前被错误分类的美国最近最大的一些银行倒闭现在得到了正确的预测。

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Duca, Marco Lo, and Tuomas A Peltonen. 2013. “Assessing Systemic Risks and Predicting Systemic Events.” <i>Journal of Banking &#38; Finance</i> 37 (7): 2183–95.</div>
</div>