def latest_gem
    Dir["*.gem"].sort.last
end   
task :default do
	puts `gem build a.gemspec`
	puts `sudo gem i --local #{latest_gem}`
    puts  `ruby -e '' -ra`
	puts `a gem mytest`
end

task :push do
    puts "pusing #{latest_gem}..."
    exec "gem push #{latest_gem}"
end    