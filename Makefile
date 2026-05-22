.PHONY: validate generate all

validate:
	ruby scripts/validate_data.rb

generate:
	ruby scripts/generate_paper_index.rb
	ruby scripts/generate_tool_index.rb
	ruby scripts/generate_stats.rb

all: generate validate
