# frozen_string_literal: true

source "https://rubygems.org"

gemspec

# Local monorepo path gems for development (the gemspec dependency resolves
# from rubygems for consumers).
gem "ask-computer", path: "../ask-computer"
gem "ask-mcp", path: "../ask-mcp"
gem "ask-core", path: "../ask-core"
gem "ask-tools", path: "../ask-tools"

group :test do
  gem "minitest", "~> 5.25"
  gem "rake", "~> 13.0"
  gem "mocha", "~> 3.1"
end
