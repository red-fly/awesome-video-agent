# Video Agent Taxonomy

This document expands the taxonomy used in the main README. The field is moving quickly, so the taxonomy is intentionally practical: each route corresponds to a kind of system you might build.

## 1. Multi-Agent Collaboration

**Design idea**: imitate human film and media production. A difficult video task is decomposed into specialized roles such as director, writer, storyboard artist, cinematographer, editor, actor, verifier, and reviewer.

**Representative systems**

- **FILMAGENT**: multi-agent end-to-end film automation in virtual 3D spaces.
- **Mora**: early generalist video generation through multiple visual agents.
- **MovieAgent**: hierarchical CoT planning from synopsis to scenes and shots.
- **MAViS**: script, shot design, character modeling, keyframe, video, and audio pipeline.
- **Camera Artist**: recursive shot generation and cinematic language injection.
- **AutoMV**: music-aware multi-agent MV generation.
- **Co-Director**: agentic generative video storytelling with global and local optimization.
- **Sima 1.0**: collaborative documentary video production workflow.

**Key bottleneck**

The central challenge is the **intent-to-execution gap**: the user gives an abstract creative goal, while the system must execute concrete assets, timelines, prompts, camera plans, subtitles, audio, and edits.

## 2. Video Editing, Compilation, and Production Assets

**Design idea**: video agents are not only generators. Many useful systems retrieve, edit, compile, or produce assets that remain editable in downstream tools.

**Representative systems**

- **CutClaw**: hours-long video editing via multimodal decomposition and music synchronization.
- **CineAgents**: instruction-driven cinematic compilation using hierarchical narrative memory.
- **DIRECT**: agentic video mashup and trailer editing.
- **Cutscene Agent**: Unreal Engine Level Sequence generation through MCP tools.
- **Aurora**: unified video editing through tool-using condition construction.
- **ComfyUI-Copilot**: agentic workflow generation for ComfyUI.

**Key bottleneck**

The problem is **editable generation**: professional workflows need timelines, tracks, scene graphs, masks, engine assets, and workflow graphs, not just opaque rendered videos.

## 3. Long-Form Reasoning and Memory

**Design idea**: long videos cannot be treated as short clips. Systems must reverse-engineer video into searchable structure: shots, scenes, events, dialogue, characters, story arcs, and user/task/global memories.

**Representative systems**

- **LongVideoAgent**: master agent gathers evidence by calling grounding and vision agents.
- **LVAgent**: multi-round collaboration among MLLM agents for long-video understanding.
- **MAGNET**: multi-agent audio-visual retrieval and reasoning across multiple videos.
- **VideoAgent-ECCV2024 / VideoAgent-Memory**: LLM-agent and memory-augmented approaches to long-video understanding.
- **OmniScript**: video-to-script for long cinematic video.
- **VideoARM**: hierarchical multimodal memory with an observe-think-act-memorize loop.
- **ProVCA**: progressive condensation for efficient long-video understanding.
- **MMProLong**: long-context VLM training recipe.
- **UniVA**: universal video agent with memory and MCP tools.

**Key bottleneck**

The problem is **video semantic reverse engineering**: converting continuous pixel/audio streams into structured narrative memory that agents can retrieve, revise, and reason over.

## 4. RL, Policy Tuning, and Tool Use

**Design idea**: once video agents use tools and multi-step plans, the hard question becomes policy learning: when to search, where to look, which tool to call, when to stop, and how much evidence is enough.

**Representative systems**

- **Video-OPD**: on-policy distillation for temporal video grounding.
- **LongVideoAgent**: RL improves tool-call efficiency and reasoning discipline.
- **ToolRL / ToRL / OpenClaw-RL / ARTIST / AgentFlow**: general agentic tool-use training methods that transfer to video orchestration.

**Key bottleneck**

The field is moving from **sequence-level sparse rewards** to **token-level, step-level, and tool-level dense signals**. This is especially important for video, where final quality evaluation is expensive and subjective.

## 5. Evaluation and Self-Improvement

**Design idea**: video agents should not only produce output, but also judge whether the output satisfies narrative, visual, temporal, and instruction-level constraints.

**Representative systems**

- **VQQA**: visual-question-based critique and improvement for generated videos.
- **AutoMV**: verifier agents and human/LLM evaluation for music videos.
- **Aurora**: separates planning/tool failures from video synthesis failures.

**Key bottleneck**

The central issue is **credit assignment**: if a video is bad, did the failure come from the plan, the retrieved reference, the mask, the shot prompt, the generator, the edit, or the verifier?

## 6. Cinematic Expression and Domain Expertise

**Design idea**: video agents need more than generic planning. They must understand film grammar, editing rhythm, music structure, cultural signals, game-engine assets, educational logic, and vertical production constraints.

**Representative systems**

- **Camera Artist**: cinematic language injection.
- **AutoMV**: music structure, lyrics, beat alignment, and visual rhythm.
- **MAVEN**: multicultural T2V generation.
- **LangDriveCTRL**: language-controllable driving scene editing.
- **MoReGen**: motion reasoning with physics simulation and rendering.
- **LASEV**: educational video generation.

**Key bottleneck**

The core problem is **domain-specific controllability**: letting agents communicate with generators and production tools through professional concepts rather than vague prompts.

## 7. World Models and Embodied Video Agents

**Design idea**: some video-agent work treats video generation as a world modeling problem. The agent must preserve multi-agent, multi-view, or embodied consistency over time.

**Representative systems**

- **ShareVerse**: shared-world consistent video generation.
- **MultiWorld**: multi-agent multi-view video world modeling.
- **MoReGen**: motion reasoning with physics simulation and rendering.
- **Action Agent**: embodied navigation video generation with flow-constrained diffusion control.

**Key bottleneck**

The hard part is **consistent dynamics**: generated video should respect viewpoint, trajectory, object permanence, motion constraints, and multi-agent spatial relations.

## A Compact Mental Model

```mermaid
flowchart LR
    U["User intent"] --> P["Planner / Director"]
    P --> M["Memory: shots, scenes, scripts, characters"]
    M --> S["Specialist agents"]
    S --> T["Tools: T2V, I2V, VLM, engine, editor"]
    T --> V["Verifier / Reviewer"]
    V -->|revise| P
    V --> O["Video, timeline, script, or editable assets"]
```

## Suggested Reading Order

1. **Mora**, **FILMAGENT**, and **MovieAgent** for the basic film-crew paradigm.
2. **MAViS**, **Camera Artist**, **AutoMV**, and **Co-Director** for long-form creative generation.
3. **CutClaw**, **CineAgents**, **DIRECT**, and **Cutscene Agent** for editing, compilation, and production assets.
4. **LongVideoAgent**, **OmniScript**, **VideoARM**, and **ProVCA** for long-video decomposition and memory.
5. **Video-OPD**, **VQQA**, and **AgentFlow** for policy tuning, critique, and self-improvement.
6. **MAVEN**, **LangDriveCTRL**, **MoReGen**, **ShareVerse**, **MultiWorld**, and **Action Agent** for domain expertise and world modeling.
7. **Vibe AIGC**, **ToolRL**, **AgentKB**, and **Agent-World** for the broader agent infrastructure behind orchestration, memory, reward design, and executable environments.
