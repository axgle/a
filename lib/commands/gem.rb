module A
  class Gem
    class << self
      def make_dirs(config)
        dir = config[:dir]

        begin
          Dir.mkdir dir
        rescue StandardError
          nil
        end

        Dir.chdir dir
        begin
          Dir.mkdir 'lib'
        rescue StandardError
          nil
        end
        begin
          Dir.mkdir 'bin'
        rescue StandardError
          nil
        end
      end

      def make_rakefile(config)
        dir = config[:dir]

        rakefile = <<~eot
          def latest_gem
              Dir["*.gem"].sort.last
          end

          task :default do
              puts `gem build #{dir}.gemspec`
              if $?.success?
                  puts "\\nyou can install it with:"
                  puts "rake install\\n"
                  puts "then run your app with:\\n#{dir}\\n"

              end
          end
          task :run do
              puts `gem build #{dir}.gemspec`
              puts `gem install --local \#{latest_gem}`
              puts "===output==="
              puts `#{dir}`

          end

          task :install do
              puts `gem install --local \#{latest_gem}`
          end

          task :push do
              puts "pusing \#{latest_gem}..."
              puts `gem push \#{latest_gem}`
              if $?.success?
                  puts "https://rubygems.org/gems/#{dir}"
              end
          end

          task :i=>:install

        eot
        IO.write 'rakefile.rb', rakefile
      end

      def make_specfile(config)
        dir = config[:dir]
        gemspec = <<~eot

          Gem::Specification.new do |s|
              s.name = "#{dir}"
              s.version = "0.0.1"
              s.summary = "summary"
              s.authors = ['authors']

              s.license = 'MIT'
              s.email = 'degcat@126.com'
              s.homepage = 'https://rubygems.org/gems/a'

              s.files =  Dir["lib/*.rb"]
              s.executables << "#{dir}"
          end

        eot
        IO.write "#{dir}.gemspec", gemspec
      end

      def index(config)
        dir = config[:dir]
        target = config[:target]

        make_dirs(config)

        make_rakefile(config)
        make_specfile(config)

        IO.write "lib/#{dir}.rb", ''

        binfile = <<~eot
          #!/usr/bin/env ruby
          puts "hello world!"
        eot
        IO.write "bin/#{dir}", binfile

        begin
          FileUtils.chmod 'u=wrx', "bin/#{dir}"
        rescue StandardError
          nil
        end

        # puts gemspec
      end
    end
  end
end
