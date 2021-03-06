+++
title = "China's no-bailout reform: impact on bond yields and rating standards"
author = ["Ernest Dong"]
lastmod = 2022-01-16T20:12:32+08:00
tags = ["产业政策", "thesis"]
draft = false
+++

[China's no-bailout reform: impact on bond yields and rating standards](https://www.sciencedirect.com/science/article/pii/S0378426621002387)


## 主题 {#主题}

债券打破刚兑后对违约率的分析，以及出现违约后对收益率和评级标准的影响

国企发行了80%的债券，但违约中只占了15%，因此作者认为政府支持是存在的。


## 数据 {#数据}

主要是债项数据和财务数据

| Variable Name           | Definition                                                                                                    |
|-------------------------|---------------------------------------------------------------------------------------------------------------|
| Issue Amount            | Gross amount of bond issue in billions of RMB                                                                 |
| Maturity                | Years to bond maturity                                                                                        |
| Coupon Rate             | Coupon rate in percentage of bonds with fixed coupons                                                         |
| Treasury Spreads        | Difference (in %) between the bond yield to maturity and Chinese Treasury yield of similar maturity           |
| Callable                | = 1 for callable bonds and 0 otherwise                                                                        |
| Putable                 | = 1 for putable bonds and 0 otherwise                                                                         |
| Senior                  | = 1 for senior bonds and 0 otherwise                                                                          |
| Sinking Fund            | = 1 for bonds with sinking fund provision and 0 otherwise                                                     |
| Enterprise              | = 1 if WIND classifies as Enterprise Bond issues and 0 otherwise                                              |
| MTN                     | = 1 if WIND classifies as Medium-term Notes and 0 otherwise                                                   |
| Corporate               | = 1 if WIND classifies as Corporate Bond issues and 0 otherwise                                               |
| Exchange                | = 1 if the bond is traded in Shanghai or Shenzhen Stock Exchange and 0 otherwise                              |
| Interbank               | =1 if the bond is traded in the interbank market and 0 otherwise                                              |
| Rating                  | An ordinal variable from 1 for AAA rating to 4 for AA- rating                                                 |
| GP\_CRA                 | = 1 for the three CRAs with global partnership (Lianhe\_Fitch, Chengxin\_Moody and Brilliance)                |
| Central SOE             | = 1 if WIND classifies the issuer as a state-owned enterprise (SOE) by Chinese central government             |
| LocalSOE                | = 1 if WIND classifies the issuer as a SOE by a Chinese local government and 0 otherwise                      |
| NonSOE                  | =1 if WIND classifies the issuer as an entity other than SOE and 0 otherwise                                  |
| Log Issuer Age          | Natural log of the age (in years) of the issuer at the time of bond issuance                                  |
| Listed                  | = 1 if the issuer has public traded equity and 0 otherwise                                                    |
| POST                    | = 1 for bonds issued after March 4, 2014 and 0 otherwise                                                      |
| Equity Beta             | Market model equity beta estimated with daily stock returns from two years prior to the bond issuance         |
| Market Model Error      | Market model residual standard error estimated with daily stock returns two years prior to the bond issuance  |
| Log of Coverage Ratio   | Natural log of the three-year average interest coverage ratio prior to the bond issuance                      |
| Log of Market Cap       | Natural log of the market capitalization (in billion RMB) at the calendar year-end prior to the bond issuance |
| Long-term Debt Ratio    | Three-year average total long-term debt to total asset ratio prior to the bond issuance                       |
| Total Debt Ratio        | Three-year average total debt to total asset ratio prior to bond issuance                                     |
| Market to Book Ratio    | Market to book ratio at the end of calendar year prior to bond issuance                                       |
| Operating Profit Margin | Three-year average operating profit margin (EBIT/Revenue) prior to bond issuance                              |
| Return on Equity        | Three-year average return on equity (net income/total equity) prior to bond issuance                          |


## 分析方法 {#分析方法}

分析超日债违约60日前后债券收益率的变化，发现显著上升；

分析违约前后不同评级债券的利差发现变大，说明违约不只是一个短期冲击。


## 模型 {#模型}

对金融机构和国企用 DIDID 分析，发现超日债违约影响不大


## 结论 {#结论}

2014之后，评级机构降低了评级标准，

增量无救助改革措施在推动中国国内债券市场向真正的信贷市场靠拢，并提高基于风险的债券定价方面是有效的