# Notes and Disambiguation

## Project Name

The repository name is intentionally kept as `awsome-video-agent` because that was the requested project name. If publishing broadly, consider adding `awesome-video-agent` as an alias in the repository description or topics.

## `VideoAgent` Name Collision

There are multiple unrelated or partially related projects named `VideoAgent`.

Known cases:

- **VideoAgent / VideoAgent2** for long-video understanding.
- **HKUDS VideoAgent** for all-in-one video understanding, editing, and remaking.
- Local file `unread/6731_VideoAgent_All_in_One_Age.pdf` appears to refer to the all-in-one framing.

When adding these papers, use disambiguated names such as:

- `VideoAgent-ECCV2024`
- `VideoAgent2`
- `HKUDS VideoAgent`

## `LASEV` vs `LAVES`

The local workspace uses `outputs/lasev-blog/LASEV_论文解读.md`, while web search results and paper snippets may refer to the system as `LAVES`.

Current README keeps `LASEV` to stay consistent with the local write-up. Before publication, verify the spelling against the final paper PDF and project page.

## Core vs Foundation

Some entries are not video-specific but are kept because they are useful infrastructure for video agents:

- `ToolRL`, `ToRL`, `ARTIST`, `AgentFlow`: tool-use policy learning.
- `AgentKB`, `LLM Agent Memory Survey`: memory and experience infrastructure.
- `Agent-World`, `FutureSim`: environment synthesis and long-horizon adaptation.
- `Vibe AIGC`: the broader creative orchestration paradigm.

These should remain in **Related Agent Foundations**, not mixed into the core video-agent paper tables unless a future version has a video-specific extension.
