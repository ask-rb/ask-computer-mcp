# frozen_string_literal: true

require_relative "test_helper"

class ComputerMcpTest < Minitest::Test
  def setup
    Ask::Computer::MCP.reset!
  end

  def test_tools_expose_computer_surface
    names = Ask::Computer::MCP.tools.map(&:name)
    expected = %w[history_status history_query screenshot click type key installer_status installer_setup]
    assert_equal expected.sort, names.sort
  end

  def test_tools_are_ask_tool_instances
    assert Ask::Computer::MCP.tools.all? { |t| t.is_a?(Ask::Tool) }
  end

  def test_tools_are_cached
    assert_same Ask::Computer::MCP.tools, Ask::Computer::MCP.tools
  end

  def test_reset_clears_cache
    first = Ask::Computer::MCP.tools
    Ask::Computer::MCP.reset!
    refute_same first, Ask::Computer::MCP.tools
  end

  def test_installer_status_tool_is_callable
    Ask::Computer::Installer.stubs(:status).returns({ installed: false, version: nil, bin: nil, history: { ok: false } })
    tool = Ask::Computer::MCP.tools.find { |t| t.name == "installer_status" }
    result = tool.execute
    assert result.success?
    assert_equal false, result.content[:installed]
  ensure
    Ask::Computer::Installer.unstub(:status) rescue nil
  end
end
