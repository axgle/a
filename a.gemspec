Gem::Specification.new do |s|
    s.name = "a"
    s.version = "0.2.8"
    s.summary = "a gem generator etc."
    s.authors = ['author']

    s.license = 'MIT'
    s.email = 'degcat@126.com'
    s.homepage = 'https://github.com/axgle/a'

    s.files =  ["README.md","a.gemspec","rakefile.rb","lib/a.rb"]
    s.files += Dir["lib/commands/*.rb"]
    s.executables << "a"

    s.require_paths << 'lib' 
    s.required_ruby_version = '>= 2.0.0'

end