require 'rubygems/command_manager'
require 'rubygems/command'

require_relative 'gem-diff/diff_command'
require_relative 'gem-diff/version'

Gem::CommandManager.instance.register_command(:diff)