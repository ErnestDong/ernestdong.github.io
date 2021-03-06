+++
title = "A comparative study of forecasting corporate credit ratings using neural networks, support vector machines, and decision trees"
author = ["Ernest Dong"]
lastmod = 2022-01-16T20:23:15+08:00
tags = ["计量模型", "thesis"]
draft = false
+++

[A comparative study of forecasting corporate credit ratings using neural networks, support vector machines, and decision trees](https://www.sciencedirect.com/science/article/pii/S1062940820301480)


## 主题 {#主题}

利用机器学习预测评级

评级是一个昂贵的复杂过程，通常需要数月时间，降低这种财务和时间成本的一种解决方案是提出基于公司历史财务信息的预测性定量模型。


## 数据 {#数据}

对金融企业和非金融企业使用了两种度量。金融企业变量包括：
资产/权益，
普通股总
总资产
总投资资本
总债务/总权益
总债务/总资产
负债总额
长期债务
长期借款
资产回报率
债务/市值
营业利润率
IS-OPER-INC
净利
利润率
EPS换比率

非金融企业包括：债务/EBITDA
FFO/总债务
EBITDA/利息
FFO/利息
CFO/债务
FFO/净利润
NWC/收入
流动资产/流动负债
（FFO + 现金）/流动负债
EBITDA/收入
现金/总债务
总债务/有形资产净值
总债务/收入
债务/资本
现金/资产
固定资本总额/固定资产总额
股权/资产
NWC/总资产
留存收益/总资产
EBITDA/总资产


## 分析方法 {#分析方法}

袋装决策树、随机森林、支持向量机和多层感知器应用于相同的数据集

由于企业信用评级不会经常变化（一个输出是上一个时间点评级的模型 accuracy 也可以达到 90%），数据集中不能包括“未来”的数据集，本文并不对 accuracy 特别关注，而是定义 Notch Distance 来衡量模型性能。缺口距离为残差绝对值的条件期望，条件是残差不为 0

此外还特别关注评级的变化，关注每个模型捕获的信用评级变化的百分比。


## 模型 {#模型}

[bagging & random forest](https://i.stack.imgur.com/sYR7y.png)

RF 和 BDT 之间的唯一区别是 RF 采取了额外的步骤。除了获取数据的随机子集外，它还在每个节点随机选择X 的一个子集，并仅在给定的X子集内计算该节点处的最佳分割.


## 结论 {#结论}

Bagged 决策树和随机森林方法与 ANN 和 SVM 相比具有更好的性能。

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
</div>