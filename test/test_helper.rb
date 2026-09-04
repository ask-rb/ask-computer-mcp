# frozen_string_literal: true

ask_rb_root = File.expand_path("../..", __dir__)
%w[ask-core ask-tools ask-schema ask-mcp ask-computer].each do |gem|
  lib = File.join(ask_rb_root, gem, "lib")
  $LOAD_PATH.unshift lib if File.directory?(lib)
end
$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "ask/computer/mcp"
require "minitest/autorun"
require "mocha/minitest"
