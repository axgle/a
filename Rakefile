task :default do
	puts `gem build a.gemspec`
	puts `gem install --local #{latest_gem}`
    puts  `ruby -e '' -ra`
	puts `a gem mytest`
end

desc 'Builds the gem'
task :build do
  sh 'gem build a.gemspec'
end

desc 'Install this gem locally'
task :install do
	puts `gem install --local #{latest_gem}`
end

desc 'Push latest gem to repo'
task :push do
    puts "pusing #{latest_gem}..."
    exec "gem push #{latest_gem}"
    if $?.success?
        puts "https://rubygems.org/gems/a"
    end
end    

task i: :install

def latest_gem
    Dir["*.gem"].sort.last
end
