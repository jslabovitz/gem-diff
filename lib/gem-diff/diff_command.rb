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
    tree.each do |name, versions|
      if versions.length < 2
        next
      elsif versions.length > 2
        warn  "#{name}: can't compare with more than two versions"
      else
        versions = versions.sort_by(&:version)[-2..1]
        paths = versions.map(&:gem_dir)
        system "diff -duawrN -x '*.o' #{paths.join(' ')} | #{ENV['PAGER']}"
      end
    end
  end

end