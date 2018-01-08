require 'rubygems/command_manager'
require 'rubygems/command'

require 'gem-diff/diff_command'

class Gem::Commands::DiffCommand
  include DiffCommand
end

Gem::CommandManager.instance.register_command(:diff)