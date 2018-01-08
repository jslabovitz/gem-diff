require 'rubygems/command_manager'
require 'rubygems/command'

require 'gem-diff/diff_command'
require 'gem-diff/diff_command/version'

Gem::CommandManager.instance.register_command(:diff)