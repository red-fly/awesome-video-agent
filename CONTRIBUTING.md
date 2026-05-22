# Contributing

Thanks for helping improve Awsome Video Agent.

## What to Add

Good entries usually satisfy at least one of these:

- The system uses agents to generate, edit, understand, evaluate, or orchestrate video.
- The paper introduces memory, tool use, policy tuning, or evaluation methods directly useful for video agents.
- The project is an open-source toolchain for agentic video production.

## Where to Add

- Add papers to [`data/papers.yaml`](./data/papers.yaml).
- Add open-source tools or engineering projects to [`data/tools.yaml`](./data/tools.yaml).
- Update the English and Chinese README tables if the entry is important enough for the main page.
- For broad conceptual additions, update [`docs/taxonomy.md`](./docs/taxonomy.md).
- See [`docs/schema.md`](./docs/schema.md) for the structured data format.

## Paper Entry Format

```yaml
- name: Short Name
  title: "Full Paper Title"
  year: 2026
  date: "2026-01"
  venue: "arXiv preprint"
  arxiv: "2601.00000"
  links:
    paper: "https://arxiv.org/abs/2601.00000"
    code: "https://github.com/example/repo"
    project: "https://example.github.io/project"
  categories:
    - multi-agent-collaboration
  task: "Short task name"
  takeaway: "One sentence explaining why this matters."
```

## Category Tags

Preferred tags:

- `multi-agent-collaboration`
- `video-editing-compilation`
- `long-form-reasoning-memory`
- `rl-policy-tuning`
- `video-evaluation-self-improvement`
- `cinematic-expression-domain-expertise`
- `domain-specific-video-editing`
- `video-world-model-embodied`

## Naming Notes

Some names are overloaded. In particular, `VideoAgent` refers to multiple unrelated projects. Please disambiguate with authors, venue, or suffixes when adding new entries.
