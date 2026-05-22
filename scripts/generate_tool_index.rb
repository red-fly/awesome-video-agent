#!/usr/bin/env ruby

require "yaml"

root = File.expand_path("..", __dir__)
tools_path = File.join(root, "data", "tools.yaml")
out_path = File.join(root, "docs", "tool-index.md")

tools = YAML.load_file(tools_path).fetch("tools")

lines = []
lines << "# Tool Index"
lines << ""
lines << "Generated from `data/tools.yaml`."
lines << ""
lines << "| Tool | Type | Why It Is Useful | Links |"
lines << "|---|---|---|---|"

tools.each do |tool|
  links = tool.fetch("links").map { |kind, url| "[#{kind.capitalize}](#{url})" }.join(" · ")
  lines << "| **#{tool.fetch("name")}** | #{tool.fetch("type")} | #{tool.fetch("takeaway")} | #{links} |"
end

File.write(out_path, lines.join("\n"))
puts "Wrote #{out_path}"
