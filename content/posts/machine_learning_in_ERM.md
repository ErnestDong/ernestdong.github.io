+++
title = "machine_learning_in_ERM"
author = ["Ernest Dong"]
date = 2022-03-14T00:00:00+08:00
tags = ["python"]
draft = false
+++

## 前言 {#前言}

{{< figure src="/images/xkcd/1838.png" >}}

什么是学习？ [维基百科](https://zh.wikipedia.org/wiki/%E5%AD%A6%E4%B9%A0)上说学习是获得新的理解、知识、行为、技能、价值观、态度和偏好的过程。在计算技术快速发展的今天，染机器去利用算法和算力去“学习”、推理、决策，就是机器学习。
机器学习按照学习的方式可以分为以下几种，但也不绝对，存在半监督学习和强化学习这种难以归类的方式，部分算法也可以横跨几种分类：

{{< figure src="/ox-hugo/mathworks.svg" caption="<span class=\"figure-number\">Figure 1: </span>一些常见的机器学习算法" >}}

机器学习深究的话，需要学习很多数学和计算机。但是工业界将常用的机器学习算法封装地很好（pytorch, vc-git-region-history-font-lock-keywords, scikit-learn），几行代码就可以实现一个模型， ~~之后便是漫无止境地调参~~ 。

本文主要参考了Pedregosa et al. (<a href="#citeproc_bib_item_4">2011</a>)的文档，在编码过程中阅读文档是有帮助的。


## 机器学习在企业风险管理中的应用 {#机器学习在企业风险管理中的应用}

Mai et al. (<a href="#citeproc_bib_item_3">2019</a>) 利用 CNN 预测企业破产，在处理文本数据时利用 word embedding 量化，AUC 曲线如图
![](https://ars.els-cdn.com/content/image/1-s2.0-S0377221718308774-gr5.jpg)

Golbayani, Florescu, and Chatterjee (<a href="#citeproc_bib_item_1">2020</a>)
使用决策树、随机森林、支持向量机和多层感知器应用于相同的数据集，预测公司未来评级。他们统计了机器学习在债券评级和公司信用评级方面的文章，很多认为 SVM 和神经网络是比较准确的。但是他们使用 Notches Distance 来对机器学习绩效来打分，认为基于决策树的两种方法更有效。

Kellner, Nagl, and Rösch (<a href="#citeproc_bib_item_2">2022</a>) 利用神经网络预测违约损失 Loss Given Default
将传统的分位数回归的回归元作为第一层，通过神经网络揭示其中的非线性关系，比如交叉项及其他非线性关系，神经网络最后一层是传统的分位数回归。利用 first order feature importance，量化输入变量的整体重要性。同时排除掉二阶的和交互的在分位数中接近于零。因此 QRNN 和分位数 QR 的分位数损失非常相似
通过允许分位数回归神经网络实现的分位数中的非线性和相互作用来扩展这种方法。这种方法大大增强了建模的灵活性。额外的灵活性在更好地分布拟合和超时样本方面带来了回报，分位数预测精度提高了 30%。同时更加 robust 。

当前机器学习最火热的两个应用方向是计算机视觉 CV 和自然语言处理 NLP ，亦有一些文献利用自然语言处理分析文本数据做研究。


## 机器学习预测信用评级 {#机器学习预测信用评级}


### 数据说明 {#数据说明}

数据来自 [kaggle](https://www.kaggle.com/datasets/agewerc/corporate-credit-rating)
(下载好的在 [这里](/files/corporate_rating.csv))

A list of 2029 credit ratings issued by major agencies such as Standard and Poors to big US firms (traded on NYSE or Nasdaq) from 2010 to 2016.

There are 30 features for every company of which 25 are financial indicators. They can be divided in:

1.  Liquidity Measurement Ratios: currentRatio, quickRatio, cashRatio, daysOfSalesOutstanding
2.  Profitability Indicator Ratios: grossProfitMargin, operatingProfitMargin, pretaxProfitMargin, netProfitMargin, effectiveTaxRate, returnOnAssets, returnOnEquity, returnOnCapitalEmployed
3.  Debt Ratios: debtRatio, debtEquityRatio
4.  Operating Performance Ratios:\` assetTurnover
5.  Cash Flow Indicator Ratios: operatingCashFlowPerShare, freeCashFlowPerShare, cashPerShare, operatingCashFlowSalesRatio, freeCashFlowOperatingCashFlowRatio

    ```python
    import pandas as pd
    # df = pd.read_csv("./corporate_rating.csv", encoding="utf-8")
    df = pd.read_csv("/Users/dcy/Code/erm/corporate_rating.csv", encoding="utf-8")
    df.info()
    ```

    ```text
       <class 'pandas.core.frame.DataFrame'>
       RangeIndex: 2029 entries, 0 to 2028
       Data columns (total 31 columns):
        #   Column                              Non-Null Count  Dtype
       ---  ------                              --------------  -----
        0   Rating                              2029 non-null   object
        1   Name                                2029 non-null   object
        2   Symbol                              2029 non-null   object
        3   Rating Agency Name                  2029 non-null   object
        4   Date                                2029 non-null   object
        5   Sector                              2029 non-null   object
        6   currentRatio                        2029 non-null   float64
        7   quickRatio                          2029 non-null   float64
        8   cashRatio                           2029 non-null   float64
        9   daysOfSalesOutstanding              2029 non-null   float64
        10  netProfitMargin                     2029 non-null   float64
        11  pretaxProfitMargin                  2029 non-null   float64
        12  grossProfitMargin                   2029 non-null   float64
        13  operatingProfitMargin               2029 non-null   float64
        14  returnOnAssets                      2029 non-null   float64
        15  returnOnCapitalEmployed             2029 non-null   float64
        16  returnOnEquity                      2029 non-null   float64
        17  assetTurnover                       2029 non-null   float64
        18  fixedAssetTurnover                  2029 non-null   float64
        19  debtEquityRatio                     2029 non-null   float64
        20  debtRatio                           2029 non-null   float64
        21  effectiveTaxRate                    2029 non-null   float64
        22  freeCashFlowOperatingCashFlowRatio  2029 non-null   float64
        23  freeCashFlowPerShare                2029 non-null   float64
        24  cashPerShare                        2029 non-null   float64
        25  companyEquityMultiplier             2029 non-null   float64
        26  ebitPerRevenue                      2029 non-null   float64
        27  enterpriseValueMultiple             2029 non-null   float64
        28  operatingCashFlowPerShare           2029 non-null   float64
        29  operatingCashFlowSalesRatio         2029 non-null   float64
        30  payablesTurnover                    2029 non-null   float64
       dtypes: float64(25), object(6)
       memory usage: 491.5+ KB
    ```

评级分布如下图

```python
df["Rating"].value_counts().plot(kind="bar")
```

```text
<AxesSubplot:>
```

{{< figure src="/ox-hugo/8e8723ae5b99e7da84b8c731ebbaa30fb88cf6ee.png" >}}

让我们处理一下数据

```python
Y = df["Rating"]
# Y = Y.replace({"CCC":"C", "CC": "C", "D":"C", "AAA":"AA" })
df["Date"] = df["Date"].apply(lambda x:x.split("/")[-1])
dummies = ["Rating Agency Name", "Sector", "Date"]
X = df[[i for i in df.columns if df[i].dtype != "object"]]
for dummy in dummies:
    X = pd.concat([X, pd.get_dummies(df[dummy], drop_first=True, prefix=dummy)], axis=1)
```


### 线性回归与决策树 {#线性回归与决策树}

我们先看一些简单直接的例子。

按照维基百科的定义，我们在计量经济学中学习的 OLS/GLS/Logit 模型也是通过机器来学习拟合样本的分布，也是一种机器学习。统计学中的 lasso/ridge 等回归方式也在模型泛化中有许多应用。

```python
from sklearn.linear_model import LogisticRegression

logit = LogisticRegression(multi_class="multinomial", solver="saga")
logit.fit(X, Y)
Ypredict = logit.predict(X)
logit.score(X,Y) # score 为模型的准确率

```

```text
/Users/dcy/Code/erm/.venv/lib/python3.10/site-packages/sklearn/linear_model/_sag.py:352: ConvergenceWarning: The max_iter was reached which means the coef_ did not converge
  warnings.warn(
0.24593395761458847
```

决策树也在日常生活中有应用，车险定价或者我们日常的决策都可以抽象成决策树。
他的思想是，一个数据集有多个特征，每个节点按照某个特征是否满足一定的条件分叉，形成一棵二叉树。
该节点选取特征分叉的决策依据是最大化“信息增益”，即分叉前后数据更“有序”，且更有序的程度最大，常见指标的有2信息熵/基尼系数等。
这棵树为了避免过拟合，我们会对决策树“剪枝”，增加一些分支条件的限制，可以看[这里](https://scikit-learn.org/stable/modules/generated/sklearn.tree.DecisionTreeClassifier.html)。

决策树好处是计算量简单，可解释性强，比较适合处理有缺失属性值的样本，能够处理不相关的特征；但是容易过拟合。

```python
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
Xtrain, Xtest, Ytrain, Ytest = train_test_split(X, Y, test_size=0.2, random_state=42)
dt = DecisionTreeClassifier(max_depth=3)
dt.fit(Xtrain, Ytrain)
dt.score(Xtest, Ytest)
```

```text
0.4064039408866995
```


### 集成学习 {#集成学习}

ensemble learning 是单个模型并不能很完美的解决某个分类或者回归问题（弱监督模型，在某些方面表现较好）的时候，那么就训练出多个弱监督模型，每个模型可能是相同的也可以是不同的，然后预测的时候将数据分别输入每个模型，最后将每个模型的输出综合起来作为该未知数据的输出即便某一个弱分类器得到了错误的预测，其他的弱分类器也可以将错误纠正回来。简而言之，采样-学习-组合。

如何训练和输出呢？


#### bagging {#bagging}

Bagging是bootstrap aggregating的简写。在 bagging 方法中，从整体数据集中采取有放回抽样得到N个数据集，在每个数据集上学习出一个模型。

随机森林就是采用了 bagging 的方式训练了许多棵决策树，是为“森林”。在输出时，每一棵树都将其结果“投票”，哪个类别多，输入样本就属于哪个类别。

```python
from sklearn.ensemble import RandomForestClassifier

rf = RandomForestClassifier(n_estimators=100, max_depth=4)
rf.fit(Xtrain, Ytrain)
rf.score(Xtest, Ytest)
```

```text
0.41625615763546797
```

Bagging主要关注降低方差，因此它在不剪枝的决策树、神经网络等学习器上效用更为明显，不容易过拟合。

{{< figure src="https://tfugcs.andfun.cn/original/2X/7/74f5a02b7692010da60a746d5469471c68b2ff3c.gif" caption="<span class=\"figure-number\">Figure 2: </span>random forest" >}}


#### boosting {#boosting}

[bagging](#bagging) 的训练是平行的，boosting 则是迭代地训练一系列的分类器，每个分类器采用的样本分布都和上一轮的学习结果有关，直观比方是每个树都去学习上一个树没有学习好的地方，代表算法有AdaBoost（Adaptive boosting）算法，以及 XGBoost 算法。
调参时可以树的深度很少就能达到很高的精度。

```python
from sklearn.ensemble import GradientBoostingClassifier

gb = GradientBoostingClassifier()
gb.fit(Xtrain, Ytrain)
gb.score(Xtest, Ytest)
```

```text
0.5197044334975369
```


### 支持向量机 {#支持向量机}

Support Vector Machine, SVM 是一种二分类器，其思想是样本分布在空间中，找到一个可以划分开样本点、并且间隔最大的的（超）平面。直观上间隔最大是为了让模型更稳健。

<a id="figure--SVM 图示"></a>

{{< figure src="https://pic2.zhimg.com/80/v2-f9e1e7fd08460a5fab044c71ed8b0bb1_1440w.jpg" caption="<span class=\"figure-number\">Figure 3: </span>SVM 图示" >}}

最简单的线性的硬间隔可分的如图 [3](#figure--SVM 图示) 所示，当然这是比较理想的情况。当样本分布更复杂的时候，我们会选择软间隔，即将之前的硬间隔最大化条件放宽一点，允许部分点出错，在优化函数中加入惩罚项。

如果还是不可以，我们会运用核函数来推导到非线形的情况，简单说就是将低维的样本点映射到高维空间，使样本线性可分。例如内积平方的核函数，\\(K(v\_1,V\_2)=(x\_1x\_2+y\_1y\_2)^2\\)，可以看作是三维空间中 \\((x\_i^2,\sqrt{2}x\_iy\_i,y\_i^2)\\) 两个点之间的距离

```python
from sklearn.svm import SVC
"""The implementation is based on libsvm. The fit time scales at least quadratically with the number of samples and may be impractical beyond tens of thousands of samples. For large datasets consider using LinearSVC or SGDClassifier instead, possibly after a Nystroem transformer."""
svm = SVC(kernel="rbf")
svm.fit(Xtrain, Ytrain)
svm.score(Xtest, Ytest)
```

```text
0.33251231527093594
```


### K means {#k-means}

> 有四个牧师去郊区布道，一开始牧师们随意选了几个布道点，并且把这几个布道点的情况公告给了郊区所有的村民，于是每个村民到离自己家最近的布道点去听课。
>
> 听课之后，大家觉得距离太远了，于是每个牧师统计了一下自己的课上所有的村民的地址，搬到了所有地址的中心地带，并且在海报上更新了自己的布道点的位置。
>
> 牧师每一次移动不可能离所有人都更近，有的人发现A牧师移动以后自己还不如去B牧师处听课更近，于是每个村民又去了离自己最近的布道点……
>
> 就这样，牧师每个礼拜更新自己的位置，村民根据自己的情况选择布道点，最终稳定了下来。

之前提到的算法都需要对数据进行一定的标注，标好某些数据属于某个分类，也就是常说的“监督学习”。K-means 是一种无监督学习，我们不需要声明训练中的哪些数据是哪个分类。

K-means 的方法是，选择初始化的 k 个样本作为初始聚类中心 \\(a\_i\\)  ，针对数据集中每个样本 \\(x\_i\\)
计算它到 k 个聚类中心的距离，并将其分到距离最小的聚类中心所对应的类中；重新计算每个类别的质心作为聚类中心 \\(a\_i\\) ，再重复上面的过程，直至聚类中心“稳定”下来。

```python
from sklearn.cluster import KMeans
import numpy as np
X = np.array([[1, 2], [1, 4], [1, 0],
              [10, 2], [10, 4], [10, 0]])
kmeans = KMeans(n_clusters=2, random_state=0).fit(X)
kmeans.predict([[0, 0], [12, 3]])
```


### 深度学习/神经网络 {#深度学习-神经网络}


#### BP 神经网络 {#bp-神经网络}

是深度学习的入门算法，所谓 BP 是反向传播 Backpropagation。它的信息处理能力来源于简单非线性函数的多次复合。

{{< figure src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Action_potential.svg/718px-Action_potential.svg.png" >}}

神经网络本意是想模仿神经元。高中我们学过神经受到刺激后不一定会产生电信号，而是需要达到阈值后才能产生动作电位。因此当神经网络的输入层收到信号传导给隐藏层后，隐藏层是直接向输出层传导，而是要经历一个非线性的“激活函数”，如 `relu` , `sigmoid`, `softsign` ，然后再进行传导。

我们可以在这里可视化地理解一下
<https://playground.tensorflow.org/>


#### CNN {#cnn}

用卷积核扫描，类似“锐化”
![](https://pic2.zhimg.com/v2-ede517995e1604d6f96cc01614d320b9_b.jpg)

```python
import torch
from torch import nn
import torchvision
from torchvision import datasets, transforms
import torch.nn.functional as F


class Net(nn.Module):
    def __init__(self):
        super().__init__()
        self.layer = nn.Sequential(
            nn.Conv2d(in_channels=1, out_channels=32, kernel_size=3),
            nn.ReLU(),
            nn.MaxPool2d(kernel_size=2),
            nn.Conv2d(32, 64, 2),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),
            nn.Flatten(),
            nn.Linear(64 * 6 * 6, 10),
            nn.Softmax(),
        )

    def forward(self, x):
        x = self.layer(x)
        return x
```


#### RNN &amp; GAN &amp; RL {#rnn-and-gan-and-rl}

-   循环神经网络：常用在 NLP 中
-   生成对抗网络：随机取样作为输入，其输出结果需要尽量模仿训练集中的真实样本，使判别网络无法判断生成网络的输出结果是否真实
-   强化学习：博弈论……

> 强化学习（RL）是机器学习的一个领域，涉及软件代理如何在环境中采取行动以最大化一些累积奖励的概念。该问题由于其一般性，在许多其他学科中得到研究，如博弈论，控制理论，运筹学，信息论，基于仿真的优化，多智能体系统，群智能，统计和遗传算法。。在运筹学和控制文献中，强化学习被称为近似动态规划或神经动态规划。--Wikipedia

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry"><a id="citeproc_bib_item_1"></a>Golbayani, Parisa, Ionu Florescu, and Rupak Chatterjee. 2020. “A Comparative Study of Forecasting Corporate Credit Ratings Using Neural Networks, Support Vector Machines, and Decision Trees.” <i>The North American Journal of Economics and Finance</i> 54: 101251. <a href="https://www.sciencedirect.com/science/article/pii/S1062940820301480">https://www.sciencedirect.com/science/article/pii/S1062940820301480</a>.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_2"></a>Kellner, Ralf, Maximilian Nagl, and Daniel Rösch. 2022. “Opening the Black Box–Quantile Neural Networks for Loss given Default Prediction.” <i>Journal of Banking &#38; Finance</i> 134: 106334. <a href="https://www.sciencedirect.com/science/article/abs/pii/S0378426621002855">https://www.sciencedirect.com/science/article/abs/pii/S0378426621002855</a>.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_3"></a>Mai, Feng, Shaonan Tian, Chihoon Lee, and Ling Ma. 2019. “Deep Learning Models for Bankruptcy Prediction Using Textual Disclosures.” <i>European Journal of Operational Research</i> 274 (2): 743–58. <a href="https://www.sciencedirect.com/science/article/pii/S0377221718308774">https://www.sciencedirect.com/science/article/pii/S0377221718308774</a>.</div>
  <div class="csl-entry"><a id="citeproc_bib_item_4"></a>Pedregosa, F., G. Varoquaux, A. Gramfort, V. Michel, B. Thirion, O. Grisel, M. Blondel, et al. 2011. “Scikit-Learn: Machine Learning in Python.” <i>Journal of Machine Learning Research</i> 12: 2825–30.</div>
</div>
