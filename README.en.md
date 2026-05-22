# Awesome Video Agent

<p align="center">
  <b>A curated map of video agents for long-video generation, understanding, editing, and cinematic orchestration.</b>
</p>

<p align="center">
  <a href="./README.md">中文</a> ·
  <a href="./docs/taxonomy.md">Taxonomy</a> ·
  <a href="./docs/reading-roadmap.md">Reading Roadmap</a> ·
  <a href="./docs/paper-index.md">Paper Index</a> ·
  <a href="./docs/tool-index.md">Tool Index</a> ·
  <a href="./docs/schema.md">Schema</a> ·
  <a href="./docs/stats.md">Stats</a> ·
  <a href="./docs/notes.md">Notes</a> ·
  <a href="./docs/backlog.md">Backlog</a> ·
  <a href="./CONTRIBUTING.md">Contributing</a> ·
  <a href="./CHANGELOG.md">Changelog</a> ·
  <a href="./data/papers.yaml">Paper Data</a>
</p>

<p align="center">
  <img alt="Papers" src="https://img.shields.io/badge/papers-42-blue">
  <img alt="Tools" src="https://img.shields.io/badge/tools-6-orange">
  <img alt="Topic" src="https://img.shields.io/badge/topic-video--agents-purple">
  <img alt="Status" src="https://img.shields.io/badge/status-curated-brightgreen">
</p>

## Overview

Video agents are moving beyond single-prompt clip generation. The new systems are closer to production crews: they plan stories, maintain memories, call tools, verify outputs, revise timelines, and expose cinematic controls.

```mermaid
flowchart LR
    U["User Intent"] --> P["Planner / Director"]
    P --> M["Memory<br/>shots · scenes · scripts · characters"]
    M --> A["Specialist Agents<br/>writer · camera · editor · verifier"]
    A --> T["Tools<br/>T2V · I2V · VLM · editor · engine"]
    T --> V["Critique / Verification"]
    V -->|revise| P
    V --> O["Outputs<br/>video · script · timeline · editable assets"]
```

This repository organizes recent work into six research routes:

| Route | Core Question | Typical Mechanism |
|---|---|---|
| **Multi-Agent Collaboration** | How can a video task be decomposed like a production pipeline? | Director, writer, storyboard, camera, editor, verifier agents |
| **Long-form Reasoning & Memory** | How can agents reason over minutes or hours of video? | Shot / scene / event memory, temporal grounding, narrative graphs |
| **RL & Policy Tuning** | How can agents learn when to search, call tools, revise, or stop? | GRPO, on-policy distillation, dense feedback, tool-use rewards |
| **Cinematic Expression & Domain Expertise** | How can agents understand film grammar and vertical production rules? | Camera language, music structure, cultural knowledge, editable timelines |
| **Evaluation & Self-Improvement** | How can agents critique and improve generated videos? | VLM-as-judge, visual questions, semantic gradients, verifier loops |
| **World Models & Embodied Video Agents** | How can video agents model dynamic worlds and embodied control? | Multi-view generation, scene graphs, navigation control, simulators |

## Coverage

The collection combines local paper summaries from this workspace with a web scan across arXiv, GitHub, and related paper/project pages. Entries are split into two layers:

- **Core Video Agent Papers**: directly about video agents, long-video agents, video generation/editing agents, cinematic compilation, or agentic video workflow.
- **Related Agent Foundations**: not always video-specific, but important for building video agents: tool learning, memory, environment synthesis, orchestration, and long-horizon adaptation.

Current coverage: **32 core video-agent papers/systems + 10 related foundations = 42 papers**, plus **6 open-source systems/tools**.

## Contents

- [Core Video Agent Papers](#core-video-agent-papers)
- [Related Agent Foundations](#related-agent-foundations)
- [Open-Source Systems and Tools](#open-source-systems-and-tools)
- [Technical Patterns](#technical-patterns)
- [Open Problems](#open-problems)
- [Repository Structure](#repository-structure)
- [Maintenance](#maintenance)

## Core Video Agent Papers

### Multi-Agent Video Generation

| Paper / System | Date | Source | Task | Core Idea | Links |
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

### Video Editing, Compilation, and Production Assets

| Paper / System | Date | Source | Task | Core Idea | Links |
|---|---|---|---|---|---|
| **CutClaw** | 2026-03-31 | arXiv preprint | Hours-long video editing | Bottom-up multimodal decomposition turns raw footage and music into searchable editing units. | [Paper](https://arxiv.org/abs/2603.29664) · [Code](https://github.com/GVCLab/CutClaw) |
| **CineAgents** | 2026-04-12 | arXiv preprint | Instruction-driven cinematic video compilation | Design-and-compose replaces retrieve-and-rank for movie and series compilation. | [Paper](https://arxiv.org/abs/2604.10456) |
| **DIRECT** | 2026-04 | arXiv preprint | Agentic video mashup and trailer editing | Multi-agent editing improves cross-level audio-visual consistency for video mashups and cinematic trailers. | [Paper](https://arxiv.org/abs/2604.04875) · [Code](https://github.com/AK-DREAM/DIRECT) |
| **Cutscene Agent** | 2026-04-28 | arXiv preprint / project page | Editable 3D cutscene generation | Agents control Unreal Engine through MCP tools and output editable Level Sequence assets. | [Project](https://kuaishou-gamemind.github.io/cutscene_agent/) |
| **Aurora** | 2026-05-18 | arXiv preprint | Unified video editing | A VLM agent translates underspecified user edits into structured plans and reference conditions. | [Paper](https://arxiv.org/abs/2605.18748) · [Code](https://github.com/yeates/Aurora) · [Project](https://yeates.github.io/Aurora-Page) |
| **Sima 1.0** | 2026-04 | arXiv preprint | Documentary video production | A collaborative multi-agent workflow targets documentary production rather than short clip generation. | [Paper](https://arxiv.org/abs/2604.07721) |
| **ComfyUI-Copilot** | 2025 | ACL 2025 System Demonstrations | AIGC workflow automation | Agentic workflow development and node documentation help bridge creative intent and executable media pipelines. | [Paper](https://aclanthology.org/2025.acl-demos.63/) · [Code](https://github.com/AIDC-AI/ComfyUI-Copilot) |

### Long-Video Understanding and Memory

| Paper / System | Date | Source | Task | Core Idea | Links |
|---|---|---|---|---|---|
| **LongVideoAgent** | 2025-12-23 | arXiv preprint | Long-video question answering | A master agent gathers evidence through grounding and vision agents instead of compressing the whole video at once. | [Paper](https://arxiv.org/abs/2512.20618) · [Project](https://longvideoagent.github.io/) |
| **OmniScript** | 2026-04-13 | arXiv preprint | Audio-visual script generation | Long-form scripts become a bridge between narrative, scene structure, audio, subtitles, and cinematic video. | [Paper](https://arxiv.org/abs/2604.11102) · [Code](https://github.com/TencentARC/OmniScript) · [Project](https://arcomniscript.github.io) |
| **Video-OPD** | 2026-02 | arXiv preprint | Temporal video grounding | On-policy distillation provides dense token-level feedback and reduces the sparse-reward cost of GRPO-style training. | [Paper](https://arxiv.org/abs/2602.02994) |
| **VideoARM** | 2025-12 | arXiv preprint | Long-video understanding with hierarchical memory | An observe-think-act-memorize loop reasons over hierarchical multimodal memories for long videos. | [Paper](https://arxiv.org/abs/2512.12360) |
| **ProVCA** | 2026-04 | arXiv preprint | Efficient long-video understanding | Progressive video condensation helps agents reason over long videos under limited context budgets. | [Paper](https://arxiv.org/abs/2604.02891) |
| **MMProLong** | 2026-05 | arXiv preprint | Long-context VLM training | Long-context VLM recipes are infrastructure for long-video agent memory and reasoning. | [Paper](https://arxiv.org/abs/2605.13831) |
| **UniVA** | 2025-11 | arXiv preprint | Interactive video agent memory | Global, task, and user memories support consistency across sustained video interactions. | [Paper](https://arxiv.org/abs/2511.08521) · [Code](https://github.com/univa-agent/univa) · [Project](https://univa.online/) |

### Evaluation and Self-Improvement

| Paper / System | Date | Source | Task | Core Idea | Links |
|---|---|---|---|---|---|
| **VQQA** | 2026-03 | arXiv preprint | Video generation evaluation and improvement | Visual question generation and VLM critique can act as semantic gradients for iterative video improvement. | [Paper](https://arxiv.org/abs/2603.12310) |

### World, Culture, and Story Consistency

| Paper / System | Date | Source | Task | Core Idea | Links |
|---|---|---|---|---|---|
| **MAVEN** | 2026-05 | arXiv preprint | Multicultural text-to-video generation | Agents add cultural relevance checks and domain knowledge to text-to-video generation. | [Paper](https://arxiv.org/abs/2605.16716) · [Code](https://github.com/AIM-SCU/CRAFT) |
| **ShareVerse** | 2026-03-03 | arXiv preprint | Shared-world consistent video generation | Multi-agent coordination targets consistency across a shared video world. | [Paper](https://arxiv.org/abs/2603.02697) |
| **MultiWorld** | 2026-04 | arXiv preprint | Multi-agent multi-view video world modeling | Multi-agent, multi-view video generation supports consistent visual world modeling. | [Paper](https://arxiv.org/abs/2604.18564) · [Project](https://multi-world.github.io/) |
| **LangDriveCTRL** | 2025-12 | arXiv preprint | Language-controllable driving scene editing | Multimodal agents translate natural language into scene-graph edits for controllable driving video scenarios. | [Paper](https://arxiv.org/abs/2512.17445) · [Project](https://yunhe24.github.io/langdrivectrl/) |
| **Action Agent** | 2026-05 | arXiv preprint | Embodied navigation video generation | Agentic navigation video generation is combined with flow-constrained diffusion control. | [Paper](https://arxiv.org/abs/2605.01477) |
| **MoReGen** | 2025-12 | arXiv preprint | Physics-aware text-to-video synthesis | Multi-agent reasoning, physics simulation, and rendering help model physically plausible motion in T2V generation. | [Paper](https://arxiv.org/abs/2512.04221) |
| **DreamStory** | 2024-07 / 2025-08 version | arXiv preprint | Story visualization | LLM-guided diffusion maintains multiple subjects across open-domain visual stories. | [Paper](https://arxiv.org/abs/2407.12899) · [Project](https://dream-xyz.github.io/dreamstory) |

## Related Agent Foundations

| Paper / System | Date | Source | Why It Matters for Video Agents | Links |
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

## Open-Source Systems and Tools

| System | Type | Why It Is Useful | Links |
|---|---|---|---|
| **OpenMontage** | Agentic video production system | Multi-pipeline engineering system with many tools and agent skills for production workflows. | [Code](https://github.com/calesthio/OpenMontage) |
| **video-use** | Coding-agent video editing tool | Lets coding agents edit videos through a programmatic toolchain. | [Code](https://github.com/browser-use/video-use) |
| **ViMax** | Agentic video generation framework | All-in-one workflow with director, screenwriter, producer, and generator roles. | [Code](https://github.com/HKUDS/ViMax) |
| **HKUDS VideoAgent** | All-in-one video agent | Broad framework for video understanding, editing, and remaking; disambiguate from other VideoAgent papers. | [Code](https://github.com/HKUDS/VideoAgent) · [Paper](https://openreview.net/forum?id=cTqGsLYkRl) |
| **Frame.AI** | Shorts / reels segmentation agent | Engineering project for turning long videos into short-form clips. | [Code](https://github.com/dyingpotato890/frame-ai) |
| **veo3-workflow-agents** | Video workflow agents | Prompt enhancement and orchestration around Veo3-style APIs. | [Code](https://github.com/nabobery/veo3-workflow-agents) |

## Technical Patterns

### 1. Crew-Like Role Decomposition

Video agents often copy the division of labor in film and media production:

- **Director / meta-planner**: turns user intent into a production plan.
- **Screenwriter / script agent**: writes dialogue, scene structure, subtitles, and narration.
- **Storyboard / shot agent**: converts scenes into shot-level visual plans.
- **Cinematographer / camera agent**: controls framing, lens, movement, lighting, and composition.
- **Editor / compiler**: retrieves, arranges, and stitches video segments.
- **Reviewer / verifier**: checks narrative logic, temporal consistency, visual quality, rhythm, and instruction following.

### 2. Hierarchical Video Memory

Long-video systems increasingly convert pixels into structured memory:

- frame / clip observations
- shot-level captions and timestamps
- scene-level summaries
- event timelines
- character profiles and relationship graphs
- global, task, and user memories

### 3. Dense Feedback for Video-Agent Policies

Video tasks suffer from sparse, expensive, and subjective final rewards. Useful signals include:

- token-level teacher feedback
- on-policy distillation
- tool-call efficiency rewards
- verifier-guided revision
- execution feedback from engines, editors, or workflow tools

### 4. Cinematic Control Interfaces

Strong systems expose professional controls instead of asking LLMs to directly produce low-level pixels or geometry:

- shot type, camera movement, lens, framing, lighting
- beat, verse, chorus, subtitle, lip-sync timing
- editable engine tracks and timeline assets
- structured conditions for T2V, I2V, video editing, and video DiT models

## Open Problems

- **Intent-to-execution gap**: preserving high-level creative intent through planning, generation, verification, and editing.
- **Long-term consistency**: maintaining characters, spaces, styles, story state, and visual identity across many shots.
- **Reward design**: training agents when video quality is delayed, costly, subjective, and multi-dimensional.
- **Editable generation**: outputting scripts, timelines, scene graphs, engine assets, and workflows instead of opaque videos.
- **Evaluation**: measuring narrative coherence, cinematic language, cultural fidelity, rhythm, and production editability.

## Repository Structure

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

## Maintenance

Validate the structured data after edits:

```bash
ruby scripts/validate_data.rb
```

Or use:

```bash
make validate
make generate
make all
```

Regenerate the paper index after changing `data/papers.yaml`:

```bash
ruby scripts/generate_paper_index.rb
```

Regenerate the tool index after changing `data/tools.yaml`:

```bash
ruby scripts/generate_tool_index.rb
```

Regenerate collection statistics:

```bash
ruby scripts/generate_stats.rb
```

## Contributing

Please add new papers to [`data/papers.yaml`](./data/papers.yaml) and place each entry under one or more routes:

- `multi-agent-collaboration`
- `video-editing-compilation`
- `long-form-reasoning-memory`
- `rl-policy-tuning`
- `video-evaluation-self-improvement`
- `cinematic-expression-domain-expertise`
- `domain-specific-video-editing`
- `video-world-model-embodied`

For each paper, include title, year, task, links, and a one-line takeaway.
