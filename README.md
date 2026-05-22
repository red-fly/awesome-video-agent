# Awesome Video Agent

<p align="center">
  <b>视频 Agent 论文、系统与技术路线整理：长视频生成、理解、编辑、编排与电影化表达。</b>
</p>

<p align="center">
  <a href="./README.en.md">English</a> ·
  <a href="./docs/taxonomy.md">技术分类</a> ·
  <a href="./docs/reading-roadmap.md">阅读路线</a> ·
  <a href="./docs/paper-index.md">论文索引</a> ·
  <a href="./docs/proceedings-scan.md">会议检索</a> ·
  <a href="./docs/tool-index.md">工具索引</a> ·
  <a href="./docs/schema.md">数据格式</a> ·
  <a href="./docs/stats.md">统计</a> ·
  <a href="./docs/notes.md">备注</a> ·
  <a href="./docs/backlog.md">待核对</a> ·
  <a href="./CONTRIBUTING.md">贡献指南</a> ·
  <a href="./CHANGELOG.md">更新日志</a> ·
  <a href="./data/papers.yaml">结构化数据</a>
</p>

<p align="center">
  <img alt="Papers" src="https://img.shields.io/badge/papers-61-blue">
  <img alt="Tools" src="https://img.shields.io/badge/tools-6-orange">
  <img alt="Topic" src="https://img.shields.io/badge/topic-video--agents-purple">
  <img alt="Status" src="https://img.shields.io/badge/status-curated-brightgreen">
</p>

## 项目简介

视频 Agent 正在从“单条 prompt 生成几秒视频”走向“可规划、可记忆、可调用工具、可验证、可迭代”的生产系统。它们不只是让模型生成像素，而是让模型像一个小型剧组一样，完成剧本、分镜、运镜、剪辑、音画同步、反馈修正和资产交付。

```mermaid
flowchart LR
    U["用户意图"] --> P["规划器 / 导演"]
    P --> M["记忆层<br/>镜头 · 场景 · 脚本 · 角色"]
    M --> A["专家 Agent<br/>编剧 · 摄影 · 剪辑 · 验证"]
    A --> T["工具层<br/>T2V · I2V · VLM · 编辑器 · 引擎"]
    T --> V["评审 / 验证"]
    V -->|修正| P
    V --> O["输出<br/>视频 · 脚本 · 时间线 · 可编辑资产"]
```

本项目按照六条技术路线整理近期视频 Agent 相关论文：

| 技术路线 | 核心问题 | 常见机制 |
|---|---|---|
| **多智能体角色化协作** | 如何像影视工业管线一样拆解复杂视频任务？ | 导演、编剧、分镜、摄影、剪辑、审稿/验证 Agent |
| **长视频分层解构与记忆管理** | 如何理解几十分钟到数小时的视频？ | 镜头/场景/事件记忆、时间定位、叙事图谱、角色档案 |
| **强化学习与策略优化** | Agent 如何学会何时搜索、调用工具、修正或停止？ | GRPO、在线策略蒸馏、稠密反馈、工具调用奖励 |
| **电影语言、领域专长与垂直视频编辑** | Agent 如何掌握运镜、节奏、文化、音乐、引擎资产和垂直行业规则？ | 电影语言注入、音乐结构、文化知识、可编辑时间线、场景图编辑 |
| **评估与自我改进** | Agent 如何评价并迭代提升生成视频？ | VLM-as-judge、视觉问题、语义梯度、验证器循环 |
| **世界模型与具身视频 Agent** | 视频 Agent 如何建模动态世界和具身控制？ | 多视角生成、场景图、导航控制、仿真器 |

## 收录范围

本项目结合了当前工作区里的论文解读稿，以及针对 arXiv、GitHub 和相关论文/项目页的一轮全网补检索。条目分成两层：

- **核心视频 Agent 论文**：直接面向视频 Agent、长视频理解、视频生成/编辑 Agent、电影剪辑编排、AIGC 视频工作流。
- **相关 Agent 基础设施论文**：不一定直接做视频，但对构建视频 Agent 很关键，例如工具学习、记忆、环境训练、长期适应和编排范式。

当前版本共收录：**51 个核心视频 Agent 条目 + 10 个相关基础设施条目 = 61 篇论文**，另有 **6 个开源系统/工具**。

本轮额外补充了近三年正式会议/论文集条目，优先来自 **ECCV 2024、EMNLP 2024、ICLR 2024/2025/2026、AAAI 2025/2026、CVPR 2025、ICCV 2025、ACL 2025/2026、NeurIPS 2025、SIGGRAPH Asia 2024/2025**。新增或转正的代表条目包括：VideoAgent-ECCV2024、VideoAgent-Memory、OmAgent、DrVideo、VCA、LVAgent、Embodied VideoAgent、MotionAgent、VideoWebArena、GROOT、ReAgent-V、MAGNET、TheoremExplainAgent、AutoMV-RealEstate、FantasyHSI、VideoChat-A1、MuMA-ToM、AniMaker、Anim-Director，以及 GenMAC、LongVideoAgent、ToolRL、AgentFlow 的正式会议来源修正。完整列表见 [论文索引](./docs/paper-index.md)、[会议检索记录](./docs/proceedings-scan.md) 和 [统计页](./docs/stats.md)。

## 目录

- [核心视频 Agent 论文](#核心视频-agent-论文)
- [相关 Agent 基础设施](#相关-agent-基础设施)
- [开源系统与工具](#开源系统与工具)
- [关键技术模式](#关键技术模式)
- [开放问题](#开放问题)
- [项目结构](#项目结构)
- [维护方式](#维护方式)

## 核心视频 Agent 论文

### 多智能体角色化协作

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **Co-Director** | 2026-04 | arXiv preprint | 智能体式生成视频叙事 | 通过全局叙事优化和局部多模态自优化，减少生成视频故事中的语义漂移。 | [Paper](https://arxiv.org/abs/2604.24842) · [Project](https://co-director-agent.github.io/) |
| **GenMAC** | 2026-03-14 | AAAI 2026 | 组合式文本到视频生成 | 用设计、生成和再设计 Agent 迭代优化组合式提示词，提高文本到视频的可控性。 | [Paper](https://ojs.aaai.org/index.php/AAAI/article/view/37418) · [arXiv](https://arxiv.org/abs/2412.04440) |
| **LASEV** | 2026-02 | arXiv preprint | 教育视频生成 | 结合语义、规则和工具反馈的批评循环，提高教育视频的可发布质量。 | [Paper](https://arxiv.org/abs/2602.11790) · [Project](https://robitsg.github.io/LASEV) |
| **MAViS** | 2025-08 | arXiv preprint | 长序列视频叙事 | 把叙事规划与 T2I、I2V、LoRA 和音频生成串成多智能体故事生产流程。 | [Paper](https://arxiv.org/abs/2508.08487) |
| **AniMaker** | 2025-06-12 | SIGGRAPH Asia 2025 | 多智能体动画叙事生成 | 导演、摄影、审稿和后期 Agent 通过 MCTS 候选片段选择生成连贯长篇动画。 | [Paper](https://arxiv.org/abs/2506.10540) · [Code](https://github.com/HITsz-TMG/Anim-Director/tree/main/AniMaker) · [Project](https://animaker-dev.github.io/) |
| **MovieAgent** | 2025-03 | arXiv preprint | 自动电影生成 | 用层次化 CoT 规划把故事梗概拆解为场景、镜头、字幕、音频和视频生成任务。 | [Paper](https://arxiv.org/abs/2503.07314) · [Code](https://github.com/showlab/MovieAgent) · [Project](https://weijiawu.github.io/MovieAgent/) |
| **FILMAGENT** | 2025-01 | arXiv preprint | 端到端虚拟电影自动化 | 将导演、编剧、演员、摄影等角色拆成专业 Agent，并通过批评、修正、验证、辩论和裁决降低生成错误。 | [Paper](https://arxiv.org/abs/2501.12909) |
| **StoryAgent** | 2024-11 | arXiv preprint | 定制化故事视频生成 | 通过多智能体协作提升定制故事生成质量，并保持主角一致性。 | [Paper](https://arxiv.org/abs/2411.04925) |
| **Mora** | 2024-03 | arXiv preprint | 通用视频生成 | 较早用多智能体框架探索 Sora 式通用视频生成能力。 | [Paper](https://arxiv.org/abs/2403.13248) · [Code](https://github.com/lichao-sun/Mora) |

### 视频编辑、剪辑编排与生产资产

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **Aurora** | 2026-05-18 | arXiv preprint | 统一视频编辑 | VLM Agent 将模糊的用户编辑意图转化为结构化计划和参考条件。 | [Paper](https://arxiv.org/abs/2605.18748) · [Code](https://github.com/yeates/Aurora) · [Project](https://yeates.github.io/Aurora-Page) |
| **Cutscene Agent** | 2026-04-28 | arXiv preprint / project page | 可编辑 3D 过场动画生成 | Agent 通过 MCP 工具控制 Unreal Engine，并输出可编辑的 Level Sequence 资产。 | [Project](https://kuaishou-gamemind.github.io/cutscene_agent/) |
| **CineAgents** | 2026-04-12 | arXiv preprint | 指令驱动的电影化视频编排 | 用“设计再组合”的方式替代简单检索排序，面向电影和剧集片段做叙事化编排。 | [Paper](https://arxiv.org/abs/2604.10456) |
| **Sima 1.0** | 2026-04 | arXiv preprint | 纪录片视频生产 | 面向纪录片生产设计协作式多智能体流程，而不只是生成短视频片段。 | [Paper](https://arxiv.org/abs/2604.07721) |
| **DIRECT** | 2026-04 | arXiv preprint | 智能体式混剪与预告片剪辑 | 多智能体剪辑提升混剪和电影预告片在片段、节奏、音画层面的整体一致性。 | [Paper](https://arxiv.org/abs/2604.04875) · [Code](https://github.com/AK-DREAM/DIRECT) |
| **CutClaw** | 2026-03-31 | arXiv preprint | 小时级长视频剪辑 | 用自底向上的多模态拆解，把原始素材和音乐转成可检索、可编排的剪辑单元。 | [Paper](https://arxiv.org/abs/2603.29664) · [Code](https://github.com/GVCLab/CutClaw) |
| **ComfyUI-Copilot** | 2025 | ACL 2025 System Demonstrations | AIGC 工作流自动化 | 用智能体式工作流开发和节点文档，把创作意图连接到可执行的媒体生产管线。 | [Paper](https://aclanthology.org/2025.acl-demos.63/) · [Code](https://github.com/AIDC-AI/ComfyUI-Copilot) |

### 长视频理解与记忆

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **MMProLong** | 2026-05 | arXiv preprint | 长上下文 VLM 训练 | 长上下文 VLM 的训练方法是长视频 Agent 记忆与推理的重要基础设施。 | [Paper](https://arxiv.org/abs/2605.13831) |
| **OmniScript** | 2026-04-13 | arXiv preprint | 音视频脚本生成 | 把长篇脚本作为叙事、场景结构、音频、字幕和电影化视频之间的桥梁。 | [Paper](https://arxiv.org/abs/2604.11102) · [Code](https://github.com/TencentARC/OmniScript) · [Project](https://arcomniscript.github.io) |
| **ProVCA** | 2026-04 | arXiv preprint | 高效长视频理解 | 渐进式视频压缩帮助 Agent 在有限上下文预算下理解长视频。 | [Paper](https://arxiv.org/abs/2604.02891) |
| **VideoChat-A1** | 2026-03-14 | AAAI 2026 | 链式镜头长视频推理 | MLLM Agent 逐步选择相关镜头、拆成子镜头，并在长视频上进行由粗到细的推理。 | [Paper](https://ojs.aaai.org/index.php/AAAI/article/view/38018) · [PDF](https://ojs.aaai.org/index.php/AAAI/article/download/38018/41980) · [arXiv](https://arxiv.org/abs/2506.06097) |
| **LongVideoAgent** | 2025-12-23 | ACL 2026 | 长视频问答 | 主 Agent 通过定位和视觉 Agent 分步收集证据，而不是一次性压缩整段视频。 | [Paper](https://arxiv.org/abs/2512.20618) · [Code](https://github.com/longvideoagent/LongVideoAgent) · [Project](https://longvideoagent.github.io/) |
| **VideoARM** | 2025-12 | arXiv preprint | 基于分层记忆的长视频理解 | 用“观察-思考-行动-记忆”循环在分层多模态记忆上进行长视频推理。 | [Paper](https://arxiv.org/abs/2512.12360) |
| **UniVA** | 2025-11 | arXiv preprint | 交互式视频 Agent 记忆 | 全局、任务和用户三层记忆支持持续视频交互中的一致性。 | [Paper](https://arxiv.org/abs/2511.08521) · [Code](https://github.com/univa-agent/univa) · [Project](https://univa.online/) |
| **LVAgent** | 2025-10 | ICCV 2025 | 协作式长视频理解 | 多个 MLLM Agent 动态分工，检索关键片段、辩论答案并多轮反思。 | [Paper](https://openaccess.thecvf.com/content/ICCV2025/html/Chen_LVAgent_Long_Video_Understanding_by_Multi-Round_Dynamical_Collaboration_of_MLLM_ICCV_2025_paper.html) · [PDF](https://openaccess.thecvf.com/content/ICCV2025/papers/Chen_LVAgent_Long_Video_Understanding_by_Multi-Round_Dynamical_Collaboration_of_MLLM_ICCV_2025_paper.pdf) · [Code](https://github.com/64327069/LVAgent) |
| **VCA** | 2025-10 | ICCV 2025 | 好奇心驱动的长视频理解 | VLM Agent 通过树搜索和自生成内在奖励探索视频片段，选择最有价值的帧。 | [Paper](https://openaccess.thecvf.com/content/ICCV2025/html/Yang_VCA_Video_Curious_Agent_for_Long_Video_Understanding_ICCV_2025_paper.html) · [PDF](https://openaccess.thecvf.com/content/ICCV2025/papers/Yang_VCA_Video_Curious_Agent_for_Long_Video_Understanding_ICCV_2025_paper.pdf) |
| **MAGNET** | 2025-09-18 | NeurIPS 2025 | 多视频音画检索与推理 | 多个专门 Agent 跨视频检索、关联和定位音视频片段，回答复杂问题。 | [Paper](https://openreview.net/forum?id=CwXyUdqFqW) · [Project](https://schowdhury671.github.io/magnet_project/) · [arXiv](https://arxiv.org/abs/2506.07016) |
| **DrVideo** | 2025-06 | CVPR 2025 | 文档检索式长视频理解 | 将长视频转成粗粒度文本文档，再用 Agent 检索循环补齐缺失证据。 | [Paper](https://openaccess.thecvf.com/content/CVPR2025/html/Ma_DrVideo_Document_Retrieval_Based_Long_Video_Understanding_CVPR_2025_paper.html) · [PDF](https://openaccess.thecvf.com/content/CVPR2025/papers/Ma_DrVideo_Document_Retrieval_Based_Long_Video_Understanding_CVPR_2025_paper.pdf) |
| **OmAgent** | 2024-11 | EMNLP 2024 | 复杂视频理解 | 通过任务拆解、帧记忆检索和动态工具调用，处理复杂视频问答。 | [Paper](https://aclanthology.org/2024.emnlp-main.559/) · [PDF](https://aclanthology.org/2024.emnlp-main.559.pdf) |
| **VideoAgent-Memory** | 2024-09 | ECCV 2024 | 记忆增强视频理解 | 用时间记忆和对象记忆组织长视频信息，让 LLM Agent 调用定位和对象工具完成长时程推理。 | [Paper](https://www.ecva.net/papers/eccv_2024/papers_ECCV/html/3241_ECCV_2024_paper.php) · [PDF](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/03241.pdf) · [Project](https://videoagent.github.io) |
| **VideoAgent-ECCV2024** | 2024-09 | ECCV 2024 | 长视频问答 | LLM Agent 迭代识别并收集关键视觉证据，借助 VLM 工具减少对全帧扫描的依赖。 | [Paper](https://www.ecva.net/papers/eccv_2024/papers_ECCV/html/10325_ECCV_2024_paper.php) · [PDF](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/10325.pdf) · [Project](https://wxh1996.github.io/VideoAgent-Website/) |

### 强化学习与策略优化

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **Video-OPD** | 2026-02 | arXiv preprint | 视频时序定位 | 在线策略蒸馏提供 token 级稠密反馈，降低 GRPO 类训练在长时序视频任务中的稀疏奖励成本。 | [Paper](https://arxiv.org/abs/2602.02994) |
| **ReAgent-V** | 2025-09-18 | NeurIPS 2025 | 奖励驱动的视频理解 | 实时奖励生成引导选帧、多视角反思和偏好/RL 式视频推理训练。 | [Paper](https://openreview.net/forum?id=D1Iw4Unvfc) · [arXiv](https://arxiv.org/abs/2506.01300) |

### 评估与自我改进

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **VQQA** | 2026-03 | arXiv preprint | 视频生成评估与改进 | 视觉问题生成和 VLM 批评可作为“语义梯度”，引导视频迭代改进。 | [Paper](https://arxiv.org/abs/2603.12310) |
| **VideoWebArena** | 2025-01-22 | ICLR 2025 | 基于视频的网页 Agent 评测 | 用视频教程驱动网页任务，评测 Agent 是否能从长上下文视频中保留技能和事实。 | [Paper](https://openreview.net/forum?id=unDQOUah0F) · [Project](https://videowebarena.github.io/) |

### 电影语言、领域专长与垂直视频编辑

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **MAVEN** | 2026-05 | arXiv preprint | 多文化文本到视频生成 | Agent 将文化相关性检查和领域知识注入文本到视频生成。 | [Paper](https://arxiv.org/abs/2605.16716) · [Code](https://github.com/AIM-SCU/CRAFT) |
| **Camera Artist** | 2026-04 | arXiv preprint | 电影化叙事视频生成 | 通过递归镜头生成和电影语言注入，让分镜规划更接近专业影视表达。 | [Paper](https://arxiv.org/abs/2604.09195) |
| **LangDriveCTRL** | 2025-12 | arXiv preprint | 自然语言可控驾驶场景编辑 | 多模态 Agent 将自然语言转化为场景图编辑，实现可控驾驶视频场景修改。 | [Paper](https://arxiv.org/abs/2512.17445) · [Project](https://yunhe24.github.io/langdrivectrl/) |
| **AutoMV** | 2025-12 | arXiv preprint | 音乐视频生成 | 整合音乐结构、歌词、节拍对齐、角色一致性和验证 Agent，形成完整 MV 生成管线。 | [Paper](https://arxiv.org/abs/2512.12196) · [Code](https://github.com/multimodal-art-projection/AutoMV) · [Project](https://m-a-p.ai/AutoMV/) |
| **MotionAgent** | 2025-10 | ICCV 2025 | 细粒度可控视频生成 | 运动场 Agent 将文本解析为对象轨迹和相机外参，用显式光流控制图生视频扩散模型。 | [Paper](https://openaccess.thecvf.com/content/ICCV2025/html/Liao_MotionAgent_Fine-grained_Controllable_Video_Generation_via_Motion_Field_Agent_ICCV_2025_paper.html) · [PDF](https://openaccess.thecvf.com/content/ICCV2025/papers/Liao_MotionAgent_Fine-grained_Controllable_Video_Generation_via_Motion_Field_Agent_ICCV_2025_paper.pdf) |
| **TheoremExplainAgent** | 2025-07 | ACL 2025 | 长篇定理讲解视频生成 | Agent 规划并生成多分钟 Manim 讲解视频，暴露纯文本解释中不易发现的推理缺陷。 | [Paper](https://aclanthology.org/2025.acl-long.332/) · [PDF](https://aclanthology.org/2025.acl-long.332.pdf) |
| **AutoMV-RealEstate** | 2025-04-11 | AAAI 2025 Demonstration Track | 房地产营销视频生成 | 自治 Agent 选择工具、编写故事指令并规划镜头轨迹，将房产图片转成营销视频。 | [Paper](https://ojs.aaai.org/index.php/AAAI/article/view/35377) · [PDF](https://ojs.aaai.org/index.php/AAAI/article/download/35377/37532) |
| **Anim-Director** | 2024-08-19 | SIGGRAPH Asia 2024 | 可控动画视频生成 | LMM 驱动的动画制作 Agent 将简短叙事转成脚本、场景图像、视频提示和候选动画片段。 | [Paper](https://arxiv.org/abs/2408.09787) · [Code](https://github.com/HITsz-TMG/Anim-Director) |
| **DreamStory** | 2024-07 / 2025-08 version | arXiv preprint | 故事可视化 | 用 LLM 引导扩散模型，在开放域视觉故事中维持多主体一致性。 | [Paper](https://arxiv.org/abs/2407.12899) · [Project](https://dream-xyz.github.io/dreamstory) |

### 世界模型与具身视频 Agent

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **Action Agent** | 2026-05 | arXiv preprint | 具身导航视频生成 | 将智能体式导航视频生成与流约束扩散控制结合起来。 | [Paper](https://arxiv.org/abs/2605.01477) |
| **MultiWorld** | 2026-04 | arXiv preprint | 多智能体多视角视频世界建模 | 多智能体、多视角视频生成有助于构建一致的视觉世界模型。 | [Paper](https://arxiv.org/abs/2604.18564) · [Project](https://multi-world.github.io/) |
| **FantasyHSI** | 2026-03-14 | AAAI 2026 | 4D 人-场景交互合成 | 图结构多智能体系统协调场景导航和动作规划，生成长时程人-场景交互视频。 | [Paper](https://ojs.aaai.org/index.php/AAAI/article/view/37758) |
| **ShareVerse** | 2026-03-03 | arXiv preprint | 共享世界一致性视频生成 | 通过多智能体协作维护共享视频世界中的角色、场景和叙事一致性。 | [Paper](https://arxiv.org/abs/2603.02697) |
| **MoReGen** | 2025-12 | arXiv preprint | 物理感知文本到视频合成 | 用多智能体推理、物理仿真和渲染增强文本到视频中的物理合理运动。 | [Paper](https://arxiv.org/abs/2512.04221) |
| **Embodied VideoAgent** | 2025-10 | ICCV 2025 | 具身动态场景理解 | 把第一视角视频、深度和位姿融合为持久场景记忆，支持具身推理、规划和操作。 | [Paper](https://openaccess.thecvf.com/content/ICCV2025/html/Fan_Embodied_VideoAgent_Persistent_Memory_from_Egocentric_Videos_and_Embodied_Sensors_ICCV_2025_paper.html) · [PDF](https://openaccess.thecvf.com/content/ICCV2025/papers/Fan_Embodied_VideoAgent_Persistent_Memory_from_Egocentric_Videos_and_Embodied_Sensors_ICCV_2025_paper.pdf) |
| **MuMA-ToM** | 2025-04-11 | AAAI 2025 | 多模态多智能体心智理论推理 | 用视频和文本描述具身多智能体交互，推理目标、信念和嵌套信念。 | [Paper](https://ojs.aaai.org/index.php/AAAI/article/view/32142) |
| **GROOT** | 2024-01-16 | ICLR 2024 Spotlight | 从游戏视频学习具身指令执行 | 把参考游戏视频作为目标规范，训练开放世界中的指令跟随 Agent。 | [Paper](https://openreview.net/forum?id=uleDLeiaT3) |

## 相关 Agent 基础设施

| 论文 / 系统 | 时间 | 来源 | 对视频 Agent 的意义 | 链接 |
|---|---|---|---|---|
| **FutureSim** | 2026-05 | arXiv preprint | 长周期事件回放为评估需要持续适应的 Agent 提供了有用思路。 | [Paper](https://arxiv.org/abs/2605.15188) · [Project](https://futuresim.github.io) · [Code](https://github.com/futuresim/futuresim) |
| **LLM Agent Memory Survey** | 2026-05 | arXiv preprint | Agent 记忆机制正从被动存储走向可复用的经验型基础设施。 | [Paper](https://arxiv.org/abs/2605.06716) |
| **Agent-World** | 2026-04-20 | arXiv preprint | 可执行环境和可验证任务可以成为 Agent 演化训练的可扩展场地。 | [Paper](https://arxiv.org/abs/2604.18292) |
| **OpenClaw-RL** | 2026-03 | arXiv preprint | 真实交互过程可以转化为智能体工具使用和规划训练信号。 | [Paper](https://arxiv.org/abs/2603.10165) |
| **Vibe AIGC** | 2026-02-06 | arXiv preprint | 复杂媒体生成应由元规划器、专家 Agent、工具和人类反馈共同编排，而不是依赖一次性 prompt。 | [Paper](https://arxiv.org/abs/2602.04575) |
| **AgentFlow** | 2026-01-26 | ICLR 2026 Oral | 在执行流中优化规划器行为，对协调多种视频工具的 Agent 很有参考价值。 | [Paper](https://openreview.net/forum?id=Mf5AleTUVK) · [arXiv](https://arxiv.org/abs/2510.05592) |
| **AgentKB** | 2025-07 | arXiv preprint | 可复用经验库能帮助 Agent 跨任务、跨领域进行规划和修正。 | [Paper](https://arxiv.org/abs/2507.06229) |
| **ARTIST** | 2025-05 | arXiv preprint | 强化学习可以训练 Agent 在内部推理和外部函数调用之间做选择。 | [Paper](https://arxiv.org/abs/2505.01441) |
| **ToolRL** | 2025-04-16 | NeurIPS 2025 | 细粒度奖励能训练更可靠的工具调用行为，超越单纯 SFT 模仿。 | [Paper](https://papers.nips.cc/paper_files/paper/2025/hash/97c5b2707228e7e3fb67e4ecc2e0e607-Abstract-Conference.html) · [arXiv](https://arxiv.org/abs/2504.13958) · [Code](https://github.com/qiancheng0/ToolRL) |
| **ToRL** | 2025-03-30 | arXiv preprint | Agent 需要学会何时内部推理、何时调用外部工具。 | [Paper](https://arxiv.org/abs/2503.23383) |

## 开源系统与工具

| 系统 | 类型 | 价值 | 链接 |
|---|---|---|---|
| **OpenMontage** | Agentic video production system | 多 pipeline、多工具、多 agent skill 的开源视频生产系统。 | [Code](https://github.com/calesthio/OpenMontage) |
| **video-use** | Coding-agent video editing tool | 让 coding agents 通过程序化工具链编辑视频。 | [Code](https://github.com/browser-use/video-use) |
| **ViMax** | Agentic video generation framework | 包含导演、编剧、制片、视频生成角色的一体化工作流。 | [Code](https://github.com/HKUDS/ViMax) |
| **HKUDS VideoAgent** | All-in-one video agent | 面向视频理解、编辑、重制的一体化框架；注意与其他 VideoAgent 论文区分。 | [Code](https://github.com/HKUDS/VideoAgent) · [Paper](https://openreview.net/forum?id=cTqGsLYkRl) |
| **Frame.AI** | Shorts / reels segmentation agent | 把长视频切成短视频片段的工程项目。 | [Code](https://github.com/dyingpotato890/frame-ai) |
| **veo3-workflow-agents** | Video workflow agents | 围绕 Veo3 风格 API 的 prompt 增强与生成编排。 | [Code](https://github.com/nabobery/veo3-workflow-agents) |

## 关键技术模式

### 1. 剧组式角色分工

常见角色包括：

- **导演 / 总规划器**：将用户意图转为可执行生产计划。
- **编剧 / 脚本 Agent**：生成剧情、对白、字幕、旁白和场景结构。
- **分镜 / 镜头 Agent**：把场景转成 shot-level 视觉计划。
- **摄影 / 运镜 Agent**：控制景别、镜头运动、构图、光照、焦段。
- **剪辑 / 编排 Agent**：检索、排序、拼接视频片段。
- **审稿 / 验证 Agent**：检查叙事逻辑、时序一致性、视觉质量、节奏和指令遵循。

### 2. 分层视频记忆

长视频 Agent 越来越依赖结构化记忆：

- 帧/片段观察
- 镜头级 caption 和时间戳
- 场景级摘要
- 事件时间线
- 角色档案和关系图谱
- 全局、任务、用户三层记忆

### 3. 面向 Agent 策略的稠密反馈

视频任务的最终奖励通常稀疏、昂贵且主观，因此需要更细粒度的训练信号：

- token 级教师反馈
- on-policy distillation
- 工具调用效率奖励
- verifier 引导的修正
- 来自引擎、编辑器、工作流工具的执行反馈

### 4. 电影化控制接口

成熟系统不会让 LLM 直接输出低层像素或 3D 坐标，而是提供专业语义接口：

- 景别、机位、运镜、焦段、构图、光照
- 节拍、主歌、副歌、字幕、唇形同步时间
- 可编辑引擎轨道和时间线资产
- T2V / I2V / 视频编辑 / Video DiT 的结构化条件

## 开放问题

- **意图-执行鸿沟**：如何让抽象创作意图稳定落到剧本、镜头、模型条件和后期编辑。
- **长期一致性**：如何在多镜头、多场景中保持角色、空间、风格和叙事状态。
- **奖励设计**：如何训练视频 Agent，因为最终视频质量昂贵、主观、延迟且多维。
- **可编辑生成**：如何输出脚本、时间线、场景图、引擎资产和工作流，而不只是黑盒视频。
- **评估体系**：如何衡量叙事连贯性、电影语言、文化准确性、节奏和生产可编辑性。

## 项目结构

```text
awesome-video-agent/
├── README.md
├── README.en.md
├── CONTRIBUTING.md
├── CHANGELOG.md
├── CITATION.cff
├── LICENSE
├── Makefile
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── workflows/
│   └── pull_request_template.md
├── data/
│   ├── papers.yaml
│   └── tools.yaml
├── docs/
│   ├── paper-index.md
│   ├── proceedings-scan.md
│   ├── backlog.md
│   ├── notes.md
│   ├── reading-roadmap.md
│   ├── schema.md
│   ├── stats.md
│   ├── taxonomy.md
│   └── tool-index.md
└── scripts/
    ├── generate_paper_index.rb
    ├── generate_stats.rb
    ├── generate_tool_index.rb
    └── validate_data.rb
```

## 维护方式

新增或修改结构化数据后，可以运行：

```bash
ruby scripts/validate_data.rb
```

也可以直接用：

```bash
make validate
make generate
make all
```

修改 `data/papers.yaml` 后，可以重新生成论文索引：

```bash
ruby scripts/generate_paper_index.rb
```

修改 `data/tools.yaml` 后，可以重新生成工具索引：

```bash
ruby scripts/generate_tool_index.rb
```

重新生成统计页：

```bash
ruby scripts/generate_stats.rb
```
