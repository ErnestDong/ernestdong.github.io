+++
title = "毕业论文"
author = ["Ernest Dong"]
lastmod = 2022-02-17T09:09:05+08:00
tags = ["thesis"]
draft = false
+++

## Presentation
[Presentation Notes](../../files/pre.pdf)
## <span class="org-todo todo TODO">TODO</span> Tasks {#tasks}

你先开始找文献，先从知网的中文核心期刊看起，慢慢从他们的英文参考文献中了解相关英文文献的关键词，然后再逐渐找些英文文献，这样文献的框架就搭起来了。本科论文首先得过文献综述观。建议你找几篇《经济研究》、《金融研究》上和这个主题大致相关（不一定有那么绝对相关的论文，大致相关就行），精度文献综述部分，看看他们的文献综述怎么写的。不过，期刊上论文的文献综述因版面有限，是浓缩过的，学位论文的文献综述篇幅要更长些。但从期刊文献综述起码能看出来文献综述应该怎么写。

分类，前人用过什么样的指标（别人没用过），有没有显著的影响

什么样的模型，原始数据 or 主成分（模型不一样/对象不一样）

看摘要、数据、模型、结论


### link {#link}

[thesis archive]({{< relref "thesis_archive.md" >}})
[经济研究](https://xueshu.baidu.com/s?wd=%28%E8%BF%9D%E7%BA%A6%20%7C%20%E4%BF%A1%E7%94%A8%E9%A3%8E%E9%99%A9%29%20journal%3A%28%E9%87%91%E8%9E%8D%E7%A0%94%E7%A9%B6%29&tn=SE_baiduxueshu_c1gjeupa&sc_f_para=sc_tasktype%3D%7BfirstAdvancedSearch%7D&sc_hit=1&bcp=2&ie=utf-8&tag_filter=%20%20%20jnls%3A%28%E3%80%8A%E9%87%91%E8%9E%8D%E7%A0%94%E7%A9%B6%E3%80%8B%29)
[金融研究](https://xueshu.baidu.com/s?wd=%28%E8%BF%9D%E7%BA%A6%20%7C%20%E4%BF%A1%E7%94%A8%E9%A3%8E%E9%99%A9%29%20journal%3A%28%E7%BB%8F%E6%B5%8E%E7%A0%94%E7%A9%B6%29&tn=SE_baiduxueshu_c1gjeupa&sc_hit=1&bcp=2&ie=utf-8&filter=sc_year%3D%7B2017%2C%2B%7D&tag_filter=%20%20%20jnls%3A%28%E3%80%8A%E7%BB%8F%E6%B5%8E%E7%A0%94%E7%A9%B6%E3%80%8B%29)


## journals {#journals}

1.  Journal of Finance
2.  Journal of Financial and Quantitative Analysis
3.  Journal of Financial Economics
4.  Review of Financial Studies
5.  Journal of Banking and Finance


## Try {#try}


### 微观指标 {#微观指标}

我国金融机构和非金融机构之间存在很大的监管差异，违约因素差别较大，历史上我国在金融机构出现风险时往往会接管，如安邦、包商等。因此我们在数据中排除掉保险、银行类的金融机构

城投？


#### 公司 {#公司}

-   公司性质
-   大股东占比
-   是否上市
-   **公司治理** ：持有基金占比


#### 经营 {#经营}

-   营收亏损
-   客户集中度：应收/应付
-   质押：标准券


#### 财务 {#财务}

-   Altman Z 指标
-   现金短债比


#### 评级 {#评级}

评级很多是违约风险很大时候连续几天内下调，所以从后往前看评级对违约很显著，但是调整成评级前一个月的评级就很差，说明评级绝对值准建立在违约风险已经很大的前提下

评级下调会有假阳性


### 中观指标 {#中观指标}


#### 行业与行业政策 {#行业与行业政策}

行业 = 行业
行业政策 = 行业 &times; 时间

违约量少。与其说是行业景气循还，不如说是行业政策导致融资环境变化


#### 流动性 {#流动性}

成交金额


#### 地理 {#地理}

省/市

地理上的传染尚不明晰，看似地理上的传染更多是因为股权、担保的关系，可能城投债违约后显现出来


#### 风险传染 {#风险传染}

-   大股东
-   地区
-   应收应付
-   宏观经济


### 宏观指标 {#宏观指标}

宏观政策对违约，更多是以稳为主，认为违约是一种正常现象，但不希望大规模的集中违约，影响实体经济，如恒大是“少数企业”的激进，但去年 12 月超预期降准释放流动性，且房贷政策有所放松。


#### 波动性 {#波动性}

上证历史波动率


#### 财政政策 {#财政政策}

政府支出/GDP


#### 货币政策 {#货币政策}

SHIBOR 利率


#### 疫情 {#疫情}

时间


#### 贸易战 {#贸易战}

时间 2018-2020


### 回归结果 {#回归结果}

[result](/files/logitres.html)
Accuracy: 0.99
Error rate: 0.01
Precision: 0.86
Recall: 0.72
f1_score: 0.78


## Try Machine Learning {#try-machine-learning}


### visualize {#visualize}

[decision tree](/ox-hugo/mldecision_tree.png)


### numbers {#numbers}

准确率（Accuracy）= (tp+tn)/(tp+fp+fn+tn)
精确率（Precision）= tp/(tp+fp)，即阳性的样本中有几个是预测正确的。
召回率（Recall）= tp/(tp+fn)，即事实为真的样本中有几个是预测正确的。
F1 = 2 / ( (1/ Precision) + (1/ Recall) )，即精确率与召回率的调和平均数。

|               | accuracy | error rate | precision | recall | f1   |
|---------------|----------|------------|-----------|--------|------|
| Logistic      | 0.99     | 0.01       | 0.86      | 0.72   | 0.78 |
| Decision Tree | 0.99     | 0.01       | 0.93      | 0.73   | 0.82 |
| Random Forest | 0.99     | 0.01       | 0.85      | 0.70   | 0.76 |


### ROC &amp; AUC {#roc-and-auc}

![ROCs](/ox-hugo/roc.png)
AUC值越大的分类器，正确率越高。
