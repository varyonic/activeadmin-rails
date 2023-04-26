require 'bundler/gem_tasks'

# Import all our rake tasks
FileList['tasks/**/*.rake'].each { |task| import task }

task default: :test

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort 'Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine'
  end
end

task :console do
  require 'irb'
  require 'irb/completion'

  ARGV.clear
  IRB.start
end
