+++
title = "Firm default prediction: a bayesian model-averaging approach"
author = ["Ernest Dong"]
lastmod = 2022-01-16T20:12:05+08:00
tags = ["计量模型", "thesis"]
draft = false
+++

[Firm default prediction: a bayesian model-averaging approach](https://eds.s.ebscohost.com/eds/pdfviewer/pdfviewer?vid=1&sid=2b984d92-27ba-4a57-8855-814ffa7c4f73%5C%40redis)


## 主题 {#主题}

利用贝叶斯模型预测违约

传统分析方法严重依赖于首先识别出违约的因子，存在 model uncertainty

选择贝叶斯是因为 Techniques incorporating  uncertainty  in  linear  models  do  not  immediately translate to nonlinear hazard models


## 数据 {#数据}

| Variable  | Description                                                         |
|-----------|---------------------------------------------------------------------|
| WC/TA     | Working capital/Total assets                                        |
| RE/TA     | Retained earnings/Total assets                                      |
| EBIT/TA   | Earnings before interest and taxes/Total assets                     |
| ME/TL     | Market equity/Total liabilities                                     |
| S/TA      | Sales/Total assets                                                  |
| TL/TA     | Total liabilities/Total assets                                      |
| CA/CL     | Current assets/Current liabilities                                  |
| NI/TA     | Net income/Total assets                                             |
| π\_MERTON | Distance to default                                                 |
| SIGMA     | Standard deviation of firm stock returns                            |
| AGE       | log(Firm age in months)                                             |
| SIZE      | ln(Market equity/Total S&P 500 market value)                        |
| EXRET     | ln(1+Firm stock return)−log(1 + S&P 500 return)                     |
| CASH/MTA  | Cash and short-term investments/(Market equity + Total liabilities) |
| MB        | Market equity/Book equity                                           |
| PRICE     | ln(Firm stock price per share)                                      |
| 1/σE      | 1/Annualized volatility of firm stock returns                       |
| ME        | Market equity                                                       |
| MEF       | Face value of firm debt                                             |


## 分析方法 {#分析方法}


## 模型 {#模型}

对模型参数进行贝叶斯估计和 Laplace 近似


## 结论 {#结论}

only the ratio of total liabilities to total assets and the inverse of the annualized volatility of firm market equity are robust predictors of bankruptcy and default and that models using only these two variables better predict bankruptcies and defaults for all firms than  models  using  all available co-variate.