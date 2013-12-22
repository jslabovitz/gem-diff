#encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'gem-diff'
  gem.version       = '0.1'
  gem.authors       = 'John Labovitz'
  gem.email         = 'johnl@johnlabovitz.com'
  gem.summary       = %q{Show differences between gems}
  gem.description   = %q{A Ruby gem which acts as a 'gem' plugin to show differences between gems.}
  # gem.homepage      = 'https://github.com/jslabovitz/itinerary.git'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'

  # gem.add_runtime_dependency 'rubygems'
end