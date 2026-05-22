#!/usr/bin/env ruby

require "yaml"

root = File.expand_path("..", __dir__)
papers_path = File.join(root, "data", "papers.yaml")
out_path = File.join(root, "docs", "paper-index.md")

papers = YAML.load_file(papers_path).fetch("papers")

labels = {
  "multi-agent-collaboration" => "Multi-Agent Collaboration",
  "video-editing-compilation" => "Video Editing and Compilation",
  "long-form-reasoning-memory" => "Long-Form Reasoning and Memory",
  "rl-policy-tuning" => "RL and Policy Tuning",
  "video-evaluation-self-improvement" => "Evaluation and Self-Improvement",
  "cinematic-expression-domain-expertise" => "Cinematic Expression and Domain Expertise",
  "domain-specific-video-editing" => "Domain-Specific Video Editing",
  "video-world-model-embodied" => "World Models and Embodied Video Agents"
}

lines = []
lines << "# Paper Index"
lines << ""
lines << "Generated from `data/papers.yaml`. A paper may have multiple category tags, but this index groups by its primary tag."
lines << ""

labels.each do |category, heading|
  entries = papers.select { |paper| paper.fetch("categories").first == category }
  next if entries.empty?

  lines << "## #{heading}"
  lines << ""
  lines << "| Paper | Year | Task | Links |"
  lines << "|---|---:|---|---|"

  entries.each do |paper|
    links = paper.fetch("links").map { |kind, url| "[#{kind.capitalize}](#{url})" }.join(" · ")
    lines << "| **#{paper.fetch("name")}** | #{paper.fetch("year")} | #{paper.fetch("task")} | #{links} |"
  end

  lines << ""
end

File.write(out_path, lines.join("\n"))
puts "Wrote #{out_path}"
