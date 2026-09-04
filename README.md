# Ask Computer MCP

MCP server exposing the [ask-computer](https://github.com/ask-rb/ask-computer)
tools over the Model Context Protocol — for **ZCode** and any MCP client.

| Tool | What it does |
|---|---|
| `history_status` | Check encrypted Computer History health |
| `history_query` | Bounded metadata-only history slice |
| `screenshot` | Desktop screenshot via Cua Driver |
| `click` | Background click (AX or pixel) |
| `type` | Background typing |
| `key` | Single key / key combo |
| `installer_status` | Is cua-driver installed? Version? |
| `installer_setup` | One-command install + optional history enable |

## Quick Setup

```bash
# Install the gem
gem install ask-computer

# That's it — the MCP server auto-starts Cua Driver when needed.
# For Computer History (nightly preview):
ask-computer setup --channel nightly --with-history
```

## ZCode Configuration

Add to `~/.zcode/cli/config.json`:

```json
{
  "mcp": {
    "servers": {
      "ask-computer-mcp": {
        "type": "stdio",
        "command": "ask-computer-mcp"
      }
    }
  }
}
```

The server auto-starts the Cua Driver daemon when launched. No manual
`cua-driver serve` needed — the MCP transport handles it.

## Manual Setup

If you prefer manual control:

```bash
# Install Cua Driver
/bin/bash -c "$(curl -fsSL https://cua.ai/driver/install.sh)"

# Start the MCP server
ask-computer-mcp

# Or use the ask-computer CLI
ask-computer status
ask-computer setup --channel nightly --with-history
```

## Development

```bash
cd ask-computer-mcp
bundle install
bundle exec rake test
```

## License

MIT — see LICENSE.
