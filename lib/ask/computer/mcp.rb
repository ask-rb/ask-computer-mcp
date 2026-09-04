# frozen_string_literal: true

require "ask-computer"
require "ask/mcp"
require_relative "mcp/version"

module Ask
  module Computer
    module MCP
      COMPUTER_TOOLS = [
        Ask::Tools::Computer::HistoryStatus,
        Ask::Tools::Computer::HistoryQuery,
        Ask::Tools::Computer::Screenshot,
        Ask::Tools::Computer::Click,
        Ask::Tools::Computer::Type,
        Ask::Tools::Computer::Key,
        Ask::Tools::Computer::InstallerStatus,
        Ask::Tools::Computer::InstallerSetup
      ].freeze

      ALL_TOOLS = COMPUTER_TOOLS.freeze

      class << self
        def tools
          @tools ||= ALL_TOOLS.map(&:new)
        end

        def start
          ensure_driver
          Ask::MCP::Server.start_stdio(
            name: "ask-computer-mcp",
            version: VERSION,
            tools: tools,
            capabilities: { tools: {} },
            debug: ENV["DEBUG"] == "1"
          )
        end

        def reset!
          @tools = nil
        end

        private

        def ensure_driver
          return if Ask::Computer.installed?
          warn "[ask-computer-mcp] Cua Driver not found — running installer (stable channel)..."
          Ask::Computer.install(channel: "stable")
          unless Ask::Computer.installed?
            warn "[ask-computer-mcp] Install failed. Install manually: /bin/bash -c \"$(curl -fsSL https://cua.ai/driver/install.sh)\""
            warn "[ask-computer-mcp] See https://cua.ai/docs/tutorials/drive-your-first-app"
            return
          end
          warn "[ask-computer-mcp] Cua Driver installed: #{Ask::Computer::Installer.version}"
        end
      end
    end
  end
end
