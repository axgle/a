task :default do
  puts `gem build a.gemspec`
  puts `gem install --local #{latest_gem}`
  puts `ruby -e '' -ra`
  puts `a gem mytest`
end

task :install do
  puts `gem install --local #{latest_gem}`
end

task :push do
  puts "pusing #{latest_gem}..."
  exec "gem push #{latest_gem}"
  puts 'https://rubygems.org/gems/a' if $CHILD_STATUS.success?
end

task i: :install

def latest_gem
  Dir['*.gem'].max
end
