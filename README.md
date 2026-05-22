# Awesome Video Agent

<p align="center">
  <b>视频 Agent 论文、系统与技术路线整理：长视频生成、理解、编辑、编排与电影化表达。</b>
</p>

<p align="center">
  <a href="./README.en.md">English</a> ·
  <a href="./docs/taxonomy.md">技术分类</a> ·
  <a href="./docs/reading-roadmap.md">阅读路线</a> ·
  <a href="./docs/paper-index.md">论文索引</a> ·
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
  <img alt="Papers" src="https://img.shields.io/badge/papers-42-blue">
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
| **电影语言与领域专长建模** | Agent 如何掌握运镜、节奏、文化、音乐、引擎资产等专业知识？ | 电影语言注入、音乐结构、文化知识、可编辑时间线 |
| **评估与自我改进** | Agent 如何评价并迭代提升生成视频？ | VLM-as-judge、视觉问题、语义梯度、验证器循环 |
| **世界模型与具身视频 Agent** | 视频 Agent 如何建模动态世界和具身控制？ | 多视角生成、场景图、导航控制、仿真器 |

## 收录范围

本项目结合了当前工作区里的论文解读稿，以及针对 arXiv、GitHub 和相关论文/项目页的一轮全网补检索。条目分成两层：

- **核心视频 Agent 论文**：直接面向视频 Agent、长视频理解、视频生成/编辑 Agent、电影剪辑编排、AIGC 视频工作流。
- **相关 Agent 基础设施论文**：不一定直接做视频，但对构建视频 Agent 很关键，例如工具学习、记忆、环境训练、长期适应和编排范式。

当前版本共收录：**32 个核心视频 Agent 条目 + 10 个相关基础设施条目 = 42 篇论文**，另有 **6 个开源系统/工具**。

## 目录

- [核心视频 Agent 论文](#核心视频-agent-论文)
- [相关 Agent 基础设施](#相关-agent-基础设施)
- [开源系统与工具](#开源系统与工具)
- [关键技术模式](#关键技术模式)
- [开放问题](#开放问题)
- [项目结构](#项目结构)
- [维护方式](#维护方式)

## 核心视频 Agent 论文

### 多智能体视频生成

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **FILMAGENT** | 2025-01 | arXiv preprint | End-to-end virtual film automation | Specialized film-crew agents collaborate through critique, correction, verification, debate, and judging. | [Paper](https://arxiv.org/abs/2501.12909) |
| **Mora** | 2024-03 | arXiv preprint | Generalist video generation | An early multi-agent visual generation framework for Sora-like generalist video capabilities. | [Paper](https://arxiv.org/abs/2403.13248) · [Code](https://github.com/lichao-sun/Mora) |
| **StoryAgent** | 2024-11 | arXiv preprint | Customized storytelling video generation | Multi-agent collaboration improves customized story generation and protagonist consistency. | [Paper](https://arxiv.org/abs/2411.04925) |
| **GenMAC** | 2024-12 | arXiv preprint | Compositional text-to-video generation | Design, generation, and redesign agents refine compositional prompts for controllable T2V generation. | [Paper](https://arxiv.org/abs/2412.04440) |
| **MovieAgent** | 2025-03 | arXiv preprint | Automated movie generation | Hierarchical CoT planning decomposes a synopsis into scenes, shots, subtitles, audio, and generated videos. | [Paper](https://arxiv.org/abs/2503.07314) · [Code](https://github.com/showlab/MovieAgent) · [Project](https://weijiawu.github.io/MovieAgent/) |
| **MAViS** | 2025-08 | arXiv preprint | Long-sequence video storytelling | Multi-agent storytelling connects narrative planning with T2I, I2V, LoRA, and audio generation. | [Paper](https://arxiv.org/abs/2508.08487) |
| **Camera Artist** | 2026-04 | arXiv preprint | Cinematic storytelling video generation | Recursive shot generation and cinematic language injection make shot planning more film-like. | [Paper](https://arxiv.org/abs/2604.09195) |
| **AutoMV** | 2025-12 | arXiv preprint | Music video generation | Music structure, lyrics, beat alignment, character consistency, and verifier agents are combined into a full MV pipeline. | [Paper](https://arxiv.org/abs/2512.12196) · [Code](https://github.com/multimodal-art-projection/AutoMV) · [Project](https://m-a-p.ai/AutoMV/) |
| **Co-Director** | 2026-04 | arXiv preprint | Agentic generative video storytelling | Global narrative optimization and local multimodal self-optimization reduce semantic drift in generative video stories. | [Paper](https://arxiv.org/abs/2604.24842) · [Project](https://co-director-agent.github.io/) |
| **LASEV** | 2026-02 | arXiv preprint | Educational video generation | Semantic, rule-based, and tool-based critique loops make educational videos more publishable. | [Paper](https://arxiv.org/abs/2602.11790) · [Project](https://robitsg.github.io/LASEV) |

### 视频编辑、剪辑编排与生产资产

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **CutClaw** | 2026-03-31 | arXiv preprint | Hours-long video editing | Bottom-up multimodal decomposition turns raw footage and music into searchable editing units. | [Paper](https://arxiv.org/abs/2603.29664) · [Code](https://github.com/GVCLab/CutClaw) |
| **CineAgents** | 2026-04-12 | arXiv preprint | Instruction-driven cinematic video compilation | Design-and-compose replaces retrieve-and-rank for movie and series compilation. | [Paper](https://arxiv.org/abs/2604.10456) |
| **DIRECT** | 2026-04 | arXiv preprint | Agentic video mashup and trailer editing | Multi-agent editing improves cross-level audio-visual consistency for video mashups and cinematic trailers. | [Paper](https://arxiv.org/abs/2604.04875) · [Code](https://github.com/AK-DREAM/DIRECT) |
| **Cutscene Agent** | 2026-04-28 | arXiv preprint / project page | Editable 3D cutscene generation | Agents control Unreal Engine through MCP tools and output editable Level Sequence assets. | [Project](https://kuaishou-gamemind.github.io/cutscene_agent/) |
| **Aurora** | 2026-05-18 | arXiv preprint | Unified video editing | A VLM agent translates underspecified user edits into structured plans and reference conditions. | [Paper](https://arxiv.org/abs/2605.18748) · [Code](https://github.com/yeates/Aurora) · [Project](https://yeates.github.io/Aurora-Page) |
| **Sima 1.0** | 2026-04 | arXiv preprint | Documentary video production | A collaborative multi-agent workflow targets documentary production rather than short clip generation. | [Paper](https://arxiv.org/abs/2604.07721) |
| **ComfyUI-Copilot** | 2025 | ACL 2025 System Demonstrations | AIGC workflow automation | Agentic workflow development and node documentation help bridge creative intent and executable media pipelines. | [Paper](https://aclanthology.org/2025.acl-demos.63/) · [Code](https://github.com/AIDC-AI/ComfyUI-Copilot) |

### 长视频理解与记忆

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **LongVideoAgent** | 2025-12-23 | arXiv preprint | Long-video question answering | A master agent gathers evidence through grounding and vision agents instead of compressing the whole video at once. | [Paper](https://arxiv.org/abs/2512.20618) · [Project](https://longvideoagent.github.io/) |
| **OmniScript** | 2026-04-13 | arXiv preprint | Audio-visual script generation | Long-form scripts become a bridge between narrative, scene structure, audio, subtitles, and cinematic video. | [Paper](https://arxiv.org/abs/2604.11102) · [Code](https://github.com/TencentARC/OmniScript) · [Project](https://arcomniscript.github.io) |
| **Video-OPD** | 2026-02 | arXiv preprint | Temporal video grounding | On-policy distillation provides dense token-level feedback and reduces the sparse-reward cost of GRPO-style training. | [Paper](https://arxiv.org/abs/2602.02994) |
| **VideoARM** | 2025-12 | arXiv preprint | Long-video understanding with hierarchical memory | An observe-think-act-memorize loop reasons over hierarchical multimodal memories for long videos. | [Paper](https://arxiv.org/abs/2512.12360) |
| **ProVCA** | 2026-04 | arXiv preprint | Efficient long-video understanding | Progressive video condensation helps agents reason over long videos under limited context budgets. | [Paper](https://arxiv.org/abs/2604.02891) |
| **MMProLong** | 2026-05 | arXiv preprint | Long-context VLM training | Long-context VLM recipes are infrastructure for long-video agent memory and reasoning. | [Paper](https://arxiv.org/abs/2605.13831) |
| **UniVA** | 2025-11 | arXiv preprint | Interactive video agent memory | Global, task, and user memories support consistency across sustained video interactions. | [Paper](https://arxiv.org/abs/2511.08521) · [Code](https://github.com/univa-agent/univa) · [Project](https://univa.online/) |

### 评估与自我改进

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **VQQA** | 2026-03 | arXiv preprint | Video generation evaluation and improvement | Visual question generation and VLM critique can act as semantic gradients for iterative video improvement. | [Paper](https://arxiv.org/abs/2603.12310) |

### 世界、文化与故事一致性

| 论文 / 系统 | 时间 | 来源 | 任务 | 核心思想 | 链接 |
|---|---|---|---|---|---|
| **MAVEN** | 2026-05 | arXiv preprint | Multicultural text-to-video generation | Agents add cultural relevance checks and domain knowledge to text-to-video generation. | [Paper](https://arxiv.org/abs/2605.16716) · [Code](https://github.com/AIM-SCU/CRAFT) |
| **ShareVerse** | 2026-03-03 | arXiv preprint | Shared-world consistent video generation | Multi-agent coordination targets consistency across a shared video world. | [Paper](https://arxiv.org/abs/2603.02697) |
| **MultiWorld** | 2026-04 | arXiv preprint | Multi-agent multi-view video world modeling | Multi-agent, multi-view video generation supports consistent visual world modeling. | [Paper](https://arxiv.org/abs/2604.18564) · [Project](https://multi-world.github.io/) |
| **LangDriveCTRL** | 2025-12 | arXiv preprint | Language-controllable driving scene editing | Multimodal agents translate natural language into scene-graph edits for controllable driving video scenarios. | [Paper](https://arxiv.org/abs/2512.17445) · [Project](https://yunhe24.github.io/langdrivectrl/) |
| **Action Agent** | 2026-05 | arXiv preprint | Embodied navigation video generation | Agentic navigation video generation is combined with flow-constrained diffusion control. | [Paper](https://arxiv.org/abs/2605.01477) |
| **MoReGen** | 2025-12 | arXiv preprint | Physics-aware text-to-video synthesis | Multi-agent reasoning, physics simulation, and rendering help model physically plausible motion in T2V generation. | [Paper](https://arxiv.org/abs/2512.04221) |
| **DreamStory** | 2024-07 / 2025-08 version | arXiv preprint | Story visualization | LLM-guided diffusion maintains multiple subjects across open-domain visual stories. | [Paper](https://arxiv.org/abs/2407.12899) · [Project](https://dream-xyz.github.io/dreamstory) |

## 相关 Agent 基础设施

| 论文 / 系统 | 时间 | 来源 | 对视频 Agent 的意义 | 链接 |
|---|---|---|---|---|
| **Vibe AIGC** | 2026-02-06 | arXiv preprint | Complex media generation should be orchestrated by a meta-planner, specialist agents, tools, and human feedback. | [Paper](https://arxiv.org/abs/2602.04575) |
| **ToolRL** | 2025-04-16 | NeurIPS 2025 Poster / arXiv preprint | Fine-grained rewards can teach reliable tool-use behavior beyond pure SFT imitation. | [Paper](https://arxiv.org/abs/2504.13958) · [Code](https://github.com/qiancheng0/ToolRL) |
| **ToRL** | 2025-03-30 | arXiv preprint | Agents need to learn when to reason internally and when to call external tools. | [Paper](https://arxiv.org/abs/2503.23383) |
| **OpenClaw-RL** | 2026-03 | arXiv preprint | Real interaction processes can become training signals for agentic tool-use and planning. | [Paper](https://arxiv.org/abs/2603.10165) |
| **ARTIST** | 2025-05 | arXiv preprint | RL can train agents to choose between internal reasoning and external function calls. | [Paper](https://arxiv.org/abs/2505.01441) |
| **AgentFlow** | 2025-10 | arXiv preprint / ICLR 2026 Oral (project page) | Optimizing planner behavior inside the execution flow is relevant to video agents that coordinate many tools. | [Paper](https://arxiv.org/abs/2510.05592) |
| **AgentKB** | 2025-07 | arXiv preprint | Reusable experience banks can help agents plan and revise across tasks and domains. | [Paper](https://arxiv.org/abs/2507.06229) |
| **LLM Agent Memory Survey** | 2026-05 | arXiv preprint | Memory mechanisms are evolving from passive storage toward reusable, experiential agent infrastructure. | [Paper](https://arxiv.org/abs/2605.06716) |
| **Agent-World** | 2026-04-20 | arXiv preprint | Executable environments and verifiable tasks can become scalable training grounds for agent evolution. | [Paper](https://arxiv.org/abs/2604.18292) |
| **FutureSim** | 2026-05 | arXiv preprint | Long-horizon event replay is a useful evaluation idea for agents that must adapt over time. | [Paper](https://arxiv.org/abs/2605.15188) · [Project](https://futuresim.github.io) · [Code](https://github.com/futuresim/futuresim) |

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
