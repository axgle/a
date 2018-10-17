Gem::Specification.new do |s|
    s.name = "a"
    s.version = "0.2.5"
    s.summary = "a gem generator etc."
    s.authors = ['author']

    s.license = 'MIT'
    s.email = 'degcat@126.com'
    s.homepage = 'https://github.com/axgle/a'

    s.files =  ["a.gemspec","rakefile.rb","lib/a.rb"]
    s.files += Dir["lib/commands/*.rb"]
    s.executables << "a"
end