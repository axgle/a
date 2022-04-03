# Generates a Ruby gems project tree.
require 'fileutils'

module A
  class Gem

    BINFILE = %q[#!/usr/bin/env ruby
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename(__FILE__)}"

  opts.on('-V', '--verbose', 'Print more info') { |v| options[:verbose] = v }
end.parse!
]

RAKEFILE = %[desc 'Used for quick help on terminal'
task :foo
  sh "echo 'foo'"
end]

GEMSPEC = %[Gem::Specification.new do |s|
  s.name = 'a'
  s.version = "0.1.0"
  s.summary = "summary"
  s.authors = ['authors']

  s.license = 'MIT'
  s.email = 'degcat@126.com'
  s.homepage = 'https://rubygems.org/gems/a'

  s.files = Dir["lib/**/*.rb"]
  s.executables << 'a'
end
]

    def initialize(config)
      dir = config[:dir]
      # Is this used anywhere?
      target = config[:target]

      make_dirs(config)
      make_rakefile(config)
      make_specfile(config)
      File.write("#{dir}/lib/#{dir}.rb", '')
      File.write("#{dir}/bin/#{dir}", BINFILE)
      FileUtils.chmod(0755, "#{dir}/bin/#{dir}", verbose: config[:verbose]) rescue nil
    end

    def make_dirs(config)
      dir = config[:dir]

      paths = ["#{dir}/lib", "#{dir}/bin"]
      paths.each { |p| FileUtils.mkdir_p(p, verbose: config[:verbose]) }
    end

    def make_rakefile(config)
      dir = config[:dir]

      File.write("#{dir}/Rakefile", RAKEFILE)
    end

    def make_specfile(config)
      dir = config[:dir]

      File.write("#{dir}/#{dir}.gemspec", GEMSPEC)
    end
  end
end
