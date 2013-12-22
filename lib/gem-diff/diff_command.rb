require 'rubygems/command'
# require 'rubygems_analyzer'

class Gem::Commands::DiffCommand < Gem::Command

  def initialize
    super 'diff', %q{Show differences between versions of gem}
  end

  def execute
    say "[diff]"
  end

end