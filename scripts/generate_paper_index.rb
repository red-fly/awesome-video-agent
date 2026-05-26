#!/usr/bin/env ruby

require "yaml"
require "date"

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
  entries = papers.select { |paper| paper.fetch("categories").first == category }.sort_by do |paper|
    date = paper.fetch("date").to_s
    case date
    when /(\d{4})-(\d{2})-(\d{2})/
      Date.new($1.to_i, $2.to_i, $3.to_i)
    when /(\d{4})-(\d{2})/
      Date.new($1.to_i, $2.to_i, 1)
    when /(\d{4})/
      Date.new($1.to_i, 1, 1)
    else
      Date.new(0, 1, 1)
    end
  end.reverse
  next if entries.empty?

  lines << "## #{heading}"
  lines << ""
  lines << "| Paper | Date | Source | Task | Links |"
  lines << "|---|---|---|---|---|"

  entries.each do |paper|
    links = paper.fetch("links").map { |kind, url| "[#{kind.capitalize}](#{url})" }.join(" · ")
    lines << "| **#{paper.fetch("name")}** | #{paper.fetch("date")} | #{paper.fetch("venue")} | #{paper.fetch("task")} | #{links} |"
  end

  lines << ""
end

File.write(out_path, lines.join("\n"))
puts "Wrote #{out_path}"
