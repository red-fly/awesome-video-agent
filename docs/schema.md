# Data Schema

This repository keeps the main collection in structured YAML files.

## `data/papers.yaml`

Top-level key:

```yaml
papers:
  - ...
```

Each paper entry uses:

| Field | Required | Description |
|---|---|---|
| `name` | Yes | Short display name used in README tables. |
| `title` | Yes | Full paper title. |
| `year` | Yes | Publication or preprint year. |
| `date` | Yes | More specific publication, preprint, or version date, such as `2026-04` or `2026-04-28`. |
| `venue` | Yes | Conference, journal, anthology, project page, or preprint source. |
| `arxiv` | No | arXiv identifier without URL. |
| `links` | Yes | Mapping of `paper`, `code`, `project`, or other useful links. |
| `categories` | Yes | One or more category tags. The first tag is treated as the primary category. |
| `task` | Yes | Short task phrase. |
| `takeaway` | Yes | One-sentence reason this paper matters. |

Preferred category tags:

- `multi-agent-collaboration`
- `video-editing-compilation`
- `long-form-reasoning-memory`
- `rl-policy-tuning`
- `video-evaluation-self-improvement`
- `cinematic-expression-domain-expertise`
- `domain-specific-video-editing`
- `video-world-model-embodied`

Example:

```yaml
- name: MovieAgent
  title: "Automated Movie Generation via Multi-Agent CoT Planning"
  year: 2025
  date: "2025-03"
  venue: "arXiv preprint"
  arxiv: "2503.07314"
  links:
    paper: "https://arxiv.org/abs/2503.07314"
    code: "https://github.com/showlab/MovieAgent"
    project: "https://weijiawu.github.io/MovieAgent/"
  categories:
    - multi-agent-collaboration
    - cinematic-expression-domain-expertise
  task: "Automated movie generation"
  takeaway: "Hierarchical CoT planning decomposes a synopsis into scenes, shots, subtitles, audio, and generated videos."
```

## `data/tools.yaml`

Top-level key:

```yaml
tools:
  - ...
```

Each tool entry uses:

| Field | Required | Description |
|---|---|---|
| `name` | Yes | Tool or project name. |
| `type` | Yes | Short type label. |
| `links` | Yes | Mapping of `code`, `project`, `paper`, or other useful links. |
| `takeaway` | Yes | One-sentence reason this tool matters. |

## Validation

Run:

```bash
ruby scripts/validate_data.rb
```

Regenerate indexes:

```bash
ruby scripts/generate_paper_index.rb
ruby scripts/generate_tool_index.rb
```
