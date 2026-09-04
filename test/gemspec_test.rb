# frozen_string_literal: true

require_relative "test_helper"

class GemspecTest < Minitest::Test
  def test_gemspec_is_valid
    spec = Gem::Specification.load(File.expand_path("../ask-computer-mcp.gemspec", __dir__))
    assert spec, "Could not load gemspec"
    assert_equal "ask-computer-mcp", spec.name
    assert spec.version.to_s > "0"
    assert_includes spec.executables, "ask-computer-mcp"
  end
end
