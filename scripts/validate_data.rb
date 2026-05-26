#!/usr/bin/env ruby

require "yaml"
require "set"

root = File.expand_path("..", __dir__)
papers_path = File.join(root, "data", "papers.yaml")
tools_path = File.join(root, "data", "tools.yaml")

papers = YAML.load_file(papers_path).fetch("papers")
tools = YAML.load_file(tools_path).fetch("tools")

def require_fields!(items, fields, label)
  items.each_with_index do |item, index|
    missing = fields.select { |field| !item.key?(field) || item[field].nil? || item[field].to_s.strip.empty? }
    next if missing.empty?

    abort "#{label}[#{index}] #{item["name"] || "(unnamed)"} missing fields: #{missing.join(", ")}"
  end
end

require_fields!(papers, %w[name title year date venue links categories task takeaway], "papers")
require_fields!(tools, %w[name type links takeaway], "tools")

paper_names = papers.map { |paper| paper["name"] }
tool_names = tools.map { |tool| tool["name"] }

duplicates = paper_names.group_by(&:itself).select { |_name, values| values.length > 1 }.keys
abort "duplicate paper names: #{duplicates.join(", ")}" unless duplicates.empty?

tool_duplicates = tool_names.group_by(&:itself).select { |_name, values| values.length > 1 }.keys
abort "duplicate tool names: #{tool_duplicates.join(", ")}" unless tool_duplicates.empty?

allowed_categories = Set.new(%w[
  multi-agent-collaboration
  video-editing-compilation
  long-form-reasoning-memory
  rl-policy-tuning
  video-evaluation-self-improvement
  cinematic-expression-domain-expertise
  domain-specific-video-editing
  video-world-model-embodied
])

unknown_categories = papers.flat_map { |paper| paper["categories"] }.uniq.reject { |category| allowed_categories.include?(category) }
abort "unknown categories: #{unknown_categories.join(", ")}" unless unknown_categories.empty?

puts "OK: #{papers.length} papers, #{tools.length} tools"
