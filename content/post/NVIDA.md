---
title: Jensen Huang and his random walk
description: 'Posts Section'
publishDate: "2023-12-31"
---

>22009年，AI教父Geoffrey Hinton率先用CUDA平台训练神经网络，结果大超预期，于是他主动写邮件联系英伟达，说“听着，我刚刚告诉一千名机器学习研究人员他们应该去买 Nvidia 显卡。你们能免费送我一块吗？"
>
>英伟达拒绝了Geoffrey Hinton的请求。
>
>那会儿黄仁勋可能还没意识到Hinton是英伟达的大恩人，深度神经网络将彻底改变英伟达的属性。不过后来OpenAI成立时，他就第一时间亲自上门，送上了最新款的DGX-1，由当时担任OpenAI董事长的马斯克亲自拆封。

>我们都知道英伟达是今年收入最高的半导体公司了，而且它的营收限制跟市场无关，只取决于它自己的产能，它只要能生产更多的GPU芯片，就一定可以全部卖出去，所以英伟达是预知了大模型时代的到来会非常依赖GPU吗？
>
>当然老黄他现在有点往回找补的意思，不想总是被说是躺赢的，最近几次演讲都有说英伟达早就注意到了AI的趋势，但是实事求是的讲，英伟达的显卡研发方向一直都是在为游戏服务，因为游戏图形非常需要并行计算的能力，但是恰好大模型的训练也需要算力集群的服务，而不是以前大家想的，是需要CPU的逻辑运算，所以显卡成了AI时代的发动机，是刚需里的刚需。
>
>所以最后的发展也和这本书想要证明的结论是一样，英伟达本来想赚游戏玩家的钱，这是它的计划，但是没想到AI火了，反而诞生了比游戏更大的市场，这一切都不是计划出来的，而是充满了随机性。
>
>AI的核心技术，神经网络，也是这样的开始，书的作者在2007年的时候，就在训练一个非常简陋的图片生成模型，他发现要让神经网络给它画一辆车的时候，怎么也画不出来，但是一次偶然的时候，他发现神经网络在对一个外星人的脸做二次生成的时候，图片开始变形，眼睛往下挪，变成了一辆汽车侧面的两个轮子，脑袋也开始变矮，构成了车的顶部，这个时候AI完全不知道它画了什么出来，但是从结果来看，这张图片比任何时候都要像车。
>
>这个就是我们所说的意外性，也指导了大模型训练往穷举方向发展的意义，你不要给AI算法去设定过于具体的目标，不完成就不让你吃饭那种，而是要用新奇性搜索，也就是Novelty Search的方式，让算法尽可能的去尝试各种方向，最后它就有可能出其不意的得到一些你想要的答案。


Reference:

[How Jensen Huang’s Nvidia Is Powering the A.I. Revolution](https://www.newyorker.com/magazine/2023/12/04/how-jensen-huangs-nvidia-is-powering-the-ai-revolution), By [Stephen Witt](https://www.newyorker.com/contributors/stephen-witt),November 27, 2023
[Why Greatness Cannot Be Planned: The Myth of the Objective](https://www.amazon.com/Why-Greatness-Cannot-Planned-Objective/dp/3319155237), by Kenneth O. Stanley, Joel Lehman, Publisher: Springer International Publishing, Year: 2015.
