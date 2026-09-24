# frozen_string_literal: true

require_relative "lib/ask/computer/mcp/version"

Gem::Specification.new do |spec|
  spec.name = "ask-computer-mcp"
  spec.version = Ask::Computer::MCP::VERSION
  spec.authors = ["Kaka Ruto"]
  spec.email = ["kaka@myrrlabs.com"]

  spec.summary = "MCP server for computer use — exposes ask-computer tools over the Model Context Protocol"
  spec.description = <<~DESC
    Exposes the ask-computer tools (HistoryStatus, HistoryQuery, Screenshot,
    Click, Type, Key, InstallerStatus, InstallerSetup) as MCP tools. Coding
    agents like ZCode, Claude Code, or Cursor connect via the ask-computer-mcp
    stdio executable. The underlying Cua Driver remains the background daemon
    (cua-driver mcp); ask-computer provides the typed history and installer
    layer that plain cua-driver mcp does not.
  DESC

  spec.homepage = "https://github.com/ask-rb/ask-computer"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/ask-rb/ask-computer/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) { Dir["lib/**/*", "bin/*", "LICENSE", "README.md", "CHANGELOG.md"] }
  spec.bindir = "bin"
  spec.executables = ["ask-computer-mcp"]
  spec.require_paths = ["lib"]

  spec.add_dependency "ask-computer", ">= 0.1.0"
  spec.add_dependency "ask-mcp", ">= 0.6.1"
  spec.add_dependency "ask-decisions", ">= 0.2.8"

  spec.add_development_dependency "minitest", "~> 5.25"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "mocha", "~> 3.1"
  spec.add_development_dependency "webmock", "~> 3.18"
  spec.add_development_dependency "vcr", "~> 6.0"
end
