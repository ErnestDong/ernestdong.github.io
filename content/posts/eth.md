+++
title = "以太坊"
author = ["Ernest Dong"]
date = 2022-08-08T00:00:00+08:00
tags = ["blockchain"]
draft = false
+++
<!-- 我觉得可以加一章写ETH的整个生态，怎么跟其他币交互，以太坊自己怎么挣钱，怎么分配利益，以及链上衍生的dapp在生态中token怎么流转、怎么挣钱
然后还有可以写下pow转pos -->

## 去中心化的状态机

以太坊 ethereum 是一个去中心化的开源的公共区块链平台，由 Vitalik Buterin 在 2013 年提出，并通过众筹的方式在 2014 年推出，是目前市值第二高的加密货币。以太坊不止是一个分布式的账本，还是一个[分布式的状态机](https://ethereum.org/en/developers/docs/evm/)，一个全球性的新型应用程序平台。
![[Ethereum in numbers](https://ethereum.org/en/what-is-ethereum/)](/attachments/ethereum.png)

### 加密货币交易原理

人们提出过许多加密算法，加密算法的本质是生成一对函数 $(P,S)$，二者互为反函数，很难在有限时间内从公钥 $P$ 推算出私钥 $S$，并且输入不同输出通常也不同，人们可以公开自己的公钥 $P$。这个函数对通常有两类作用：一种是加密通信：Alice对信息$M$ 加密为$P(M)$，Bob利用自己的私钥解密为$S(P(M))=M$；一种是数字签名：Alice 发送信息 $M$时，同时发送$(M,S(M))$给对方，Bob 验证$M=P(S(M))$从而确认信息是 Alice 发出的没有被篡改。

加密货币中，地址为公钥，人们可以通过公钥查询这个地址的所有交易，进而推算出该地址的余额。而私钥则需保密保管，有了私钥才可以对地址上的信息进行修改，如Alice将一笔交易信息$(M,S_A(M), P_B(M), \dots)$发送到区块链上由矿工验证交易由 Alice 发出，并在区块链上进行相应的操作。比特币的交易操作依赖于比特币的脚本([Bitcoin Script](https://www.liaoxuefeng.com/article/1124144362997184))。下图是一个比特币交易的例子，out addr 里面包含的其实是一条脚本和交易比特币的数量。只有满足了脚本的条件交易才会执行，例如只有拥有私钥可解密的人才能获得这些比特币。这种脚本有一定的可编程性，例如等待7天后再放款给卖家。
![比特币交易](/attachments/btc.jpeg)

### 不止于账本：EVM 与智能合约

以太坊相对于比特币的重要改进之一是引入了图灵完备性。现代计算机起源于 Alan Turing 的思想实验“图灵机”，图灵机可以解决可计算的问题。迄今为止，所有计算模型都能够用图灵机模型模拟。任何计算装置，无论是算盘还是计算机，都不能超越图灵机模型的计算能力。某种编程语言能够“图灵完备”则意味着可以做到图灵机能做到的任何事情。

以太坊虚拟机 EVM 是以太坊图灵完备性的载体。以太坊设计了一个虚拟机 EVM，它不仅高效地储存了以太坊的交易信息，还保存了一个机器状态，可以根据预定义的一组规则在不同的区块之间进行更改，并且可以执行任意的机器指令 op code。
![evm](https://github.com/ErnestDong/foam/blob/blockchain/attachments/evm.png?raw=true)

智能合约是图灵完备带来的成果之一。EVM 的 op code 是图灵完备的，对比图灵不完备的比特币脚本，其差异类似于 Excel2019 所能完成的工作与 python 所能完成的工作。基于此，以太坊开发出了智能合约 smart contract，并由此诞生出广泛的生态。所谓智能合约是存储运行在 EVM 之上的程序，在满足预先确定的条件时会运行这些程序，实现所谓的“代码即法律”(code is law)。这意味着以太坊的交易可以基于特定条件才可以实现，比如只有 Bob 执行了某些行为后才能收到 Alice 给予的钱。以下是 solidity 编写的拍卖[合约例子](https://docs.soliditylang.org/en/v0.8.14/solidity-by-example.html)节选，智能合约省略了拍卖中间的费用且足够透明：

```solidity
contract SimpleAuction {
    address public highestBidder;
    uint public highestBid;
    // 调用`auction = SimpleAuction(拍卖物品地址, 底价);`可以构造一个拍卖合约 `auction`
    constructor(address payable beneficiaryAddress, uint reserve) {
        beneficiary = beneficiaryAddress;
        highestBid = reserve
    }
    // 如果有人出价，调用 `action.bid()` 并支付一定的代币。调用结果要么全部执行，要么全不执行
    function bid() external payable {
        // 如果低于当前最高价，报错并退回到不执行的状态
        if (msg.value <= highestBid)
            revert BidNotHighEnough(highestBid);
        // 否则将之前的最高价退回给出价人
        highestBidder.send(highestBid)
        // 并将调用者的信息保存成 highestBidder
        highestBidder = msg.sender;
        highestBid = msg.value;
    }
    function auctionEnd() external {
        // 拍卖结束，将拍卖品转给 highestBidder
        beneficiary.transfer(highestBidder);
    }
}
```

智能合约可以部署到某个公开地址上，由其他智能合约或者用户账户来调用，满足条件则执行并将结果写入，不满足条件则会将 EVM 回退到执行前的状态。

智能合约可以通过预言机 oracle 与现实世界交互。例如利用多台分布式的计算机对汇率做出陈述，并采用投票的方式确定结果，智能合约再根据预言机的信息做出判断，就可以实现一个汇率的衍生品。

### 不止于加密资产：以太坊的 gas 机制

图灵机无法解决“停机问题”，即一个程序是否能在有限的时间之内结束运行。如果恶意或者错误的程序无法停机/持续时间过长，那么其他的交易也会被阻塞。这也是为何比特币的脚本被故意设计成图灵不完备的，没有循环和跳转指令。

以太坊采用了 gas 机制来解决图灵机的停机问题。gas 好比是汽车所加的汽油，我们为了避免以太坊这辆永远会运行的汽车停不下来，会对执行操作设定一定的汽油量(gas)。所谓 gas 是以太坊支付的手续费，不同的 op code、区块难度等有不同的基础费率，提供额外的 gas 可以在网络拥堵时吸引矿工优先计算。当耗尽用户设定的 gas 上限而交易仍未完成时，EVM 会回退到交易执行前的状态，并把剩余的资金退还给用户，gas 转移给矿工或销毁。有限的 gas 保证了 EVM 不会因为恶意或错误的代码阻塞，同时也激励更多矿工进入以太坊的系统为 EVM 的计算提供算力，让 EVM 之上的操作可以更快。
![平均gas价格](/attachments/gas%20price.png)

## 一枚 ether 的冒险

为了支持基于以太坊的交易，以太坊 ethereum 发行了原生的加密货币 ether(ETH)。接下来我们将介绍 ETH 在以太坊生态中的流转过程。

### ETH 的产出

ETH 的供应也是去中心化且透明的。以太坊是一个通胀模型，系统并没有规定以太币发行量的上限。矿工的收益一共有三部分：区块奖励、gas 以及 MEV。
区块奖励为矿工开采出一个新区块的奖励，平均12-14秒左右出一个区块，奖励由最初的每区块5个ETH降低为现如今的2个ETH，叔块的计算也能获得1.75个ETH。gas多出的部分分给矿工，基础费率部分通过“burn”销毁以避免过度的通胀。最后为最大可提取价值 MEV，为矿工通过在区块中添加和排除交易并更改区块中的交易顺序，可以从区块生产中得到的价值。
![一个区块](/attachments/gas.png)

目前开采区块的方式为 PoW 机制，未来将转为 PoS 机制。
以太坊的交易被处理为区块。与比特币类似，以太坊也是要求矿工找到一个 nonce，哈希计算后数值满足前若干位为0(使用“难度”difficulty 衡量)；但以太坊为了避免持有 ASIC 矿机的矿池形成中心化，采用了不适合 ASIC 芯片计算的内存密集的算法[ethash](https://ethereum.org/zh/developers/docs/consensus-mechanisms/pow/mining-algorithms/ethash/)。在听到新的交易请求时，每个以太坊网络节点会添加这笔交易到本地的内存池。一个挖矿节点将几十或上百个交易请求汇总到潜在区块中，从而尽量多收取交易手续费，同时保证不超出区块 gas 限制。节点将验证有效性并执行 op code，更新 EVM 的状态，交易打包为一个 Merkle Tree，取头节点的 hash 作为摘要。最后进行广播，交易被写入链上。

> 算法的过程是根据过去的区块生成随机数种子，进而得到一个初始为 16M 的随机 Cache，再从 16M 的 Cache 生成初始为 1G 大小的 Dataset，同时根据发生的交易生成 Merkle-Tree 数据结构，保留头节点的 hash 作为所有交易的摘要。利用头节点的 hash、Dataset，不断尝试随机数 nonce 以满足区块链难度。当尝试得到满足的结果时广播，其他节点可以比较容易地验证结果并达成“共识”Consensus，进入下一个区块的开采。Cache 和 Dataset 大小会随时间线性增长以满足摩尔定律。

未来以太坊将转向 Proof of Stake 机制，不再需要矿工而是需要“验证者”validator。用户需要质押 32 ETH 来获得作为验证者的资格。 验证者被随机选择去创建区块，并且负责检查和确认那些不是由他们创造的区块。 一个用户的权益也被用于激励良好的验证者行为的一种方式。 例如，用户可能会因为离线（验证失败）而损失一部分权益， 或因故意勾结而损失他们的全部权益。验证者之间没有竞争的关系，只需要在被选中的时候创建区块并且在没有被选中的时候验证他人提交的区块。如果为恶意区块提供证明，验证者就会失去质押的 ETH。

PoS 和 PoW 都可能遇到“51%攻击”，但目前而言都是这样的攻击都不经济的。PoS相对更节能，gas费率更低，并且对 sharding 更友好每秒钟交易量更高，但安全性有待检验，不利于流动性可能会导致通缩和财富集中化。目前以太坊主网仍在 PoW 机制上，而 testnet Ropsten 已成功切换。当前的 PoW 链将转化为“执行层”，即将于主网进行“合并” Merge。届时，以太坊难度炸弹将使新区块开采变得十分困难，鼓励矿工转向 PoS；也可能会存在分叉的风险。

### ETH 的使用与转换

我们可以通过metamask等钱包，连接到 ethereum 主网。然后我们选择兑换成满足 ERC-20 的 token 或直接使用 ETH。例如，opensea 可以直接使用 ETH 购买 NFT，或者我们可以选择兑换为与美元挂钩的 ERC20-USDT token、与黄金挂钩的 AurusGOLD token、与社区治理相关的 UNI token 等等。

以太坊是一个平台，在这个平台上的应用可以通过 ICO 的方式发行同质化的 token 筹集资金，把 token 看作是股权，抑或是通过发行 token 的方式发行自己应用中的专属代币，方便用户使用应用中的服务。此外，这些应用也可以发行非同质化的 token，即后文将讲述的 NFT。

代币 token 可以代表以太坊平台上的几乎任何东西，以太坊文档中列出了在线平台中的信誉积分、游戏中一个角色的技能、彩票卷、金融资产类似于公司股份的资产、像美元一样的法定货币、一盎司黄金等等。ERC-20 提案给出了同质化 token 的标准，这样去中心化的钱包、交易所等可以使用一套相同的 API 读取、操作不同的 token。不同用户钱包中的 ERC20 代币，只有数量的不同，代币内部是没有任何区别的。

## 基于 token 的生态

### dapp 与 DeFi

### NFT

### DAO
