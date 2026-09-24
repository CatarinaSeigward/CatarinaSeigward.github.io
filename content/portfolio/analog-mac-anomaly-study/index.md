---
title: "Anomaly Detection on a 6-bit Analog MAC Array"
description: A simulation study of what it costs to run machine-sound anomaly detection on an analog in-memory compute array with no A/D conversion between hidden layers.
date: "2026-09-13"
group: research
work: [Hardware-aware ML, Simulation study]
techs: [PyTorch, DCASE 2020, MLPerf Tiny]
cover: noise.png
coverFit: contain
projectUrl: https://github.com/CatarinaSeigward/analog-mac-anomaly-study
---

Analog in-memory compute promises large energy savings for always-on inference, but it pays for them
in precision: device mismatch, weight-programming error and signal-path noise all land directly on
the result. This study asks what that costs for a concrete task — unsupervised machine-sound anomaly
detection, ToyCar from DCASE 2020 Task 2 — on a behavioural model of a 30 × 30, 6-bit analog MAC
array.

The MLPerf Tiny reference model for this task needs 380 crossbar tiles. The first job was fitting it
into a realistic budget: **6 tiles**, which then has to survive the hardware constraints.

## Results

Metric is AUC, mean ± std over training seeds × 10 simulated chips.

| Finding | Key numbers |
|---|---|
| A 6-tile model is viable on the simulated array | 0.729 ± 0.012 analog vs 0.720–0.727 in fp32 — about 80% of the above-chance discrimination of the 380-tile reference (0.785) |
| Spend the 30-dimensional input budget on time, not frequency | 6 bands × 5 frames beats 30 bands × 1 frame by +0.068 (*t* = 4.2) |
| Programming error up to 3% is nearly free — with hardware-aware training | 0.718–0.728 at σ_prog ≤ 3%; without it, chips worse than random appear from 1% |
| Dropping inter-layer A/D costs ≤ 0.01 while signal-path noise stays below ≈ 0.5 LSB | +0.003 / −0.010 at 0.24 / 0.47 LSB; both architectures fail at ≈ 1 LSB |
| That architecture needs activation noise during training; per-chip calibration is no substitute | 0.665 → 0.738 on a quiet chip; 11 min of calibration recovers 0.022 of a 0.083 gap |
| 6-bit weights/signals/bias are sufficient; 4-bit collapses | 6 / 8 / 10 bits: 0.729 / 0.727 / 0.727; 4 bits: 0.449 |

![Hardware-aware training keeps AUC close to fp32 as weight-programming error grows; without it, the worst simulated chip falls below random guessing](noise.png)

The useful output for a chip team is not a single accuracy number but a budget: how much signal-path
noise the analog path may spend before the model stops working, and which of those costs training can
absorb rather than the hardware having to pay for them.

Everything here is simulation. The device parameters come from published test-chip specifications,
every modelling assumption is written down in the repository, and nothing has been verified on
silicon.
