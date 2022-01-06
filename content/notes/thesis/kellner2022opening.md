+++
title = "Opening the black box–quantile neural networks for loss given default prediction"
author = ["Ernest Dong"]
lastmod = 2022-01-06T11:26:25+08:00
tags = ["thesis"]
draft = false
+++

[Opening the black box--quantile neural networks for loss given default prediction](https://www.sciencedirect.com/science/article/abs/pii/S0378426621002855)


## 主题 {#主题}

针对贷款数据集进行分位数回归

与中位数相比，更高的分位数是由对宏观经济的更高敏感性以及整体更高的非线性和相互作用驱动的，这强调了分位数的重要性。


### 机器学习 {#机器学习}

本文也介绍了使用机器学习进行信用风险建模的相关文献。

监督学习的文章普遍的共识是，更灵活的机器学习模型优于线性 logit 回归。
而深度学习里面，Mai et al. (<a href="#citeproc_bib_item_5">2019</a>)利用 CNN 预测企业违约。

此外还有与传统计量方式结合，Li and Chen (<a href="#citeproc_bib_item_4">2021</a>)结合逻辑回归和神经网络来增强辨别能力，Sigrist and Hirnschall (<a href="#citeproc_bib_item_6">2019</a>)将 Tobit 和决策树结合。

机器学习(<a href="#citeproc_bib_item_2">Kaposty, Kriebel, and Löderbusch 2020</a>)在损失给定默认值方面的应用结果证明随机森林是最好的。


### 可解释性 {#可解释性}

Horel et al. (<a href="#citeproc_bib_item_1">2018</a>)等人方法的扩展，详见 [分析方法](#分析方法)


## 数据 {#数据}

全球信用数据 (GCD)，这是世界上最大的损失数据库之一。该财团由 55 家全球代理银行组成，包括多个系统相关机构。这些数据为银行业提供了独特而广阔的视角。


## 分析方法 {#分析方法}

估计和预测违约损失 (LGD)与经济之间存在复杂且潜在的非线性关系。Krüger and Rösch (<a href="#citeproc_bib_item_3">2017</a>)使用线性分位数回归来预测 LGD 分布的不同部分。尽管这种方法能够捕捉预测变量对分布的不同影响，但它仅限于预测变量和感兴趣变量之间的线性关系，并且（非线性）交互的评估在计算上会很繁重。

使用基于梯度信息的特征重要性度量，使我们能够将神经网络的预测分解为它们的相对特征重要性以及与所有其他特征的相互作用。

打开黑匣子的方法是 first order feature importance，量化输入变量的整体重要性。同时排除掉二阶的和交互的在分位数中接近于零。因此 QRNN 和 QR 的分位数损失非常相似


## 模型 {#模型}

分位数 QR 回归与 QRNN

将传统的分位数回归的回归元作为第一层，通过神经网络揭示其中的非线性关系，比如交叉项及其他非线性关系，神经网络最后一层是传统的分位数回归。


## 结论 {#结论}

通过允许分位数回归神经网络实现的分位数中的非线性和相互作用来扩展这种方法。这种方法大大增强了建模的灵活性。额外的灵活性在更好地分布拟合和超时样本方面带来了回报，分位数预测精度提高了 30%。同时更加 robust 。

宏观经济变量占美国样本的三分之一，强调了 LGD 对经济环境的依赖性。相反，欧洲数据集中最大的一阶特征重要性是抵押品，因此是贷款特征。宏观经济仅占整体重要性的 10-15%。

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Horel, Enguerrand, Virgile Mison, Tao Xiong, Kay Giesecke, and Lidia Mangu. 2018. “Sensitivity Based Neural Networks Explanations.” <i>Arxiv Preprint Arxiv:1812.01029</i>.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_2"></a>Kaposty, Florian, Johannes Kriebel, and Matthias Löderbusch. 2020. “Predicting Loss given Default in Leasing: A Closer Look at Models and Variable Selection.” <i>International Journal of Forecasting</i> 36 (2): 248–66.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_3"></a>Krüger, Steffen, and Daniel Rösch. 2017. “Downturn Lgd Modeling Using Quantile Regression.” <i>Journal of Banking &#38; Finance</i> 79: 42–56.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_4"></a>Li, Yiheng, and Weidong Chen. 2021. “Entropy Method of Constructing a Combined Model for Improving Loan Default Prediction: A Case Study in China.” <i>Journal of the Operational Research Society</i> 72 (5): 1099–1109.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_5"></a>Mai, Feng, Shaonan Tian, Chihoon Lee, and Ling Ma. 2019. “Deep Learning Models for Bankruptcy Prediction Using Textual Disclosures.” <i>European Journal of Operational Research</i> 274 (2): 743–58.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_6"></a>Sigrist, Fabio, and Christoph Hirnschall. 2019. “Grabit: Gradient Tree-Boosted Tobit Models for Default Prediction.” <i>Journal of Banking &#38; Finance</i> 102: 177–92. <a href="https://www.sciencedirect.com/science/article/pii/S0378426619300573">https://www.sciencedirect.com/science/article/pii/S0378426619300573</a>.</div>
</div>