#!/usr/bin/env ruby

require "yaml"
require "date"

root = File.expand_path("..", __dir__)
papers_path = File.join(root, "data", "papers.yaml")
out_path = File.join(root, "docs", "paper-index.md")

papers = YAML.load_file(papers_path).fetch("papers")

labels = {
  "creative-generation-orchestration" => "Creative Generation and Production Orchestration",
  "video-editing-assets" => "Video Editing, Recomposition, and Editable Assets",
  "long-video-understanding-memory" => "Long-Video Understanding, Retrieval, and Memory",
  "policy-evaluation-improvement" => "Policy Learning, Evaluation, and Self-Improvement",
  "world-model-embodied-interaction" => "World Modeling, Interaction, and Embodied Control"
}

lines = []
lines << "# Paper Index"
lines << ""
lines << "Generated from `data/papers.yaml`. Each paper is assigned to one primary route according to its main delivered capability."
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
