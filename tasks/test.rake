require_relative "application_generator"

desc "Run the full suite using 1 core"
task test: [:spec, :cucumber]

desc 'Creates a test rails app for the specs to run against'
task :setup, [:rails_env, :template] do |_t, opts|
  ActiveAdmin::ApplicationGenerator.new(opts).generate
end

desc "Run the specs"
task :spec do
  system("rspec")
end

desc "Run the cucumber scenarios"
task cucumber: [:"cucumber:regular", :"cucumber:reloading"]

namespace :cucumber do

  desc "Run the standard cucumber scenarios"
  task :regular do
    system("cucumber")
  end

  desc "Run the cucumber scenarios that test reloading"
  task :reloading do
    system("cucumber --profile class-reloading")
  end

end
