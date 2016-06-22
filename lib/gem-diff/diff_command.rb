require 'rubygems/command'
require 'pp'

class Gem::Commands::DiffCommand < Gem::Command

  def initialize
    super 'diff', %q{Show differences between versions of gem}
  end

  def execute
    if options[:args].empty?
      gems = Gem::Specification
    else
      gems = options[:args].map { |n| Gem::Specification.find_all_by_name(n) }.flatten
    end
    tree = {}
    gems.each do |gem|
      unless gem.default_gem?
        tree[gem.name] ||= []
        tree[gem.name] << gem
      end
    end
    tree.reject { |n, v| v.length < 2 }.each do |name, versions|
      versions.sort_by!(&:version)
      warn "#{name} has more than one version -- only comparing last two" if versions.length > 2
      paths = versions[-2..-1].map(&:gem_dir)
      system "git diff --word-diff=color #{paths.join(' ')}"
    end
  end

end
