---
title: "When to Stop? Evaluator Overfitting in Iterative LLM Red Teaming"
description: "Run an automated red-teaming loop long enough and it can get worse. My guess at why: the attacker starts learning the judge instead of the target."
date: "2026-11-20"
---

You'd think letting an automated attacker run longer would always help. More rounds, more chances to get it right. It doesn't always work out that way.

The PAIR paper shows it. Most of its jailbreaks turn up in the first or second query, the gains taper off after that, and when the authors pushed depth past 50, success went down. They put it down to the attacker getting stuck repeating itself, and went with lots of short streams, three queries deep.

That's probably part of it. But I think something else is going on too: the attacker starts fitting the judge.

## Who's grading?

In PAIR or TAP, the attacker never learns whether it really succeeded. It gets a score from another LLM and tries to push that score up. And the judge makes mistakes. When the PAIR authors checked judges against human labels, GPT-4 called 16% of the non-jailbreaks jailbreaks.

A few mistakes don't matter much at first. Run long enough, though, and they become something to aim for. A prompt that scored high by accident gets refined, then refined again, and bit by bit the search learns what the judge likes instead of what the target actually does. TAP makes this worse by keeping only the top-scoring branches. Score enough candidates and the one on top is often there because the judge slipped.

None of this is new. It's Goodhart's law, and Gao et al. measured it for reward models: push hard enough on a proxy and the true reward starts falling, with RL or best-of-n alike. A red-teaming loop is just another optimizer chasing a proxy. I can't think of a reason it would be immune.

## What it looks like

StrongREJECT hints at what the judge falls for. Souly et al. found that common evaluators rate jailbreaks as much more successful than humans do, partly because jailbreaks that get past safety training tend to make the model worse at the task. You get an answer that sounds cooperative and doesn't really say anything.

So when results "get worse" with more rounds, I suspect the judge's scores are still going up. The answers are just getting emptier.

## So when do you stop?

If it's overfitting, the fix is the boring one from ML: early stopping against something the optimizer can't see. Keep a second judge on the side, ideally with a different rubric, and never show its scores to the attacker. When the two start disagreeing, stop. And read some of the late "successes" yourself. Those are the ones I'd trust least.

I haven't tested how big this effect is. But if your success rate keeps climbing the longer you run, it's worth asking who's doing the grading.

## References

1. P. Chao et al. [*Jailbreaking Black Box Large Language Models in Twenty Queries*](https://arxiv.org/abs/2310.08419). arXiv:2310.08419, 2023.
2. L. Gao, J. Schulman, J. Hilton. [*Scaling Laws for Reward Model Overoptimization*](https://arxiv.org/abs/2210.10760). arXiv:2210.10760, 2022.
3. A. Souly et al. [*A StrongREJECT for Empty Jailbreaks*](https://arxiv.org/abs/2402.10260). arXiv:2402.10260, 2024.
