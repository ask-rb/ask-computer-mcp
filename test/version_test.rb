# frozen_string_literal: true

require_relative "test_helper"

class VersionTest < Minitest::Test
  def test_version
    assert_match(/\A\d+\.\d+\.\d+/, Ask::Computer::MCP::VERSION)
  end
end
