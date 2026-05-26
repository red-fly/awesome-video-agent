#!/usr/bin/env ruby

require "yaml"

root = File.expand_path("..", __dir__)
papers = YAML.load_file(File.join(root, "data", "papers.yaml")).fetch("papers")
tools = YAML.load_file(File.join(root, "data", "tools.yaml")).fetch("tools")
out_path = File.join(root, "docs", "stats.md")

category_labels = {
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
lines << "# Collection Stats"
lines << ""
lines << "Generated from `data/papers.yaml` and `data/tools.yaml`."
lines << ""
lines << "- Papers: **#{papers.length}**"
lines << "- Tools: **#{tools.length}**"
lines << ""

lines << "## Papers by Primary Category"
lines << ""
lines << "| Category | Count |"
lines << "|---|---:|"
category_labels.each do |category, label|
  count = papers.count { |paper| paper.fetch("categories").first == category }
  lines << "| #{label} | #{count} |" if count.positive?
end
lines << ""

lines << "## Papers by Year"
lines << ""
lines << "| Year | Count |"
lines << "|---:|---:|"
papers.group_by { |paper| paper.fetch("year") }.sort.each do |year, entries|
  lines << "| #{year} | #{entries.length} |"
end
lines << ""

lines << "## Papers by Source"
lines << ""
lines << "| Source | Count |"
lines << "|---|---:|"
papers.group_by { |paper| paper.fetch("venue") }.sort.each do |venue, entries|
  lines << "| #{venue} | #{entries.length} |"
end
lines << ""

lines << "## Tools by Type"
lines << ""
lines << "| Type | Count |"
lines << "|---|---:|"
tools.group_by { |tool| tool.fetch("type") }.sort.each do |type, entries|
  lines << "| #{type} | #{entries.length} |"
end

File.write(out_path, lines.join("\n"))
puts "Wrote #{out_path}"
