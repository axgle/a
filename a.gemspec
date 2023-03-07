require_relative 'lib/version'

Gem::Specification.new do |s|
    s.name = 'a'
    # Semantic Versioning: https://semver.org/#summary
    s.version = A::VERSION
    s.summary = 'a gem generator etc.'
    s.authors = %w(axgle neet93)

    s.license = 'MIT'
    s.email = 'gehirnmav7@protonmail.com'
    s.homepage = 'https://github.com/neet93/a'

    s.files =  %w(README.md a.gemspec Rakefile lib/version.rb)
    #s.files += Dir['lib/commands/*.rb']
    s.executables << 'a'

    #s.require_paths << 'lib' 
    s.required_ruby_version = '>= 2.0.0'

end
