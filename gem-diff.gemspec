#encoding: utf-8

require_relative 'lib/gem-diff/version'

Gem::Specification.new do |s|
  s.name          = 'gem-diff'
  s.version       = DiffCommand::VERSION
  s.summary       = %q{Show differences between gems}
  s.description   = %q{A Ruby gem which acts as a 'gem' plugin to show differences between gems.}
  s.author        = 'John Labovitz'
  s.email         = 'johnl@johnlabovitz.com'
  s.homepage      = 'https://github.com/jslabovitz/gem-diff.git'
  s.license       = 'MIT'
  s.files         = `git ls-files`.split($/)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_path  = 'lib'

  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'rubygems-tasks', '~> 0.2'
end