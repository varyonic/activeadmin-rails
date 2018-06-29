desc "Run the full suite using 1 core"
task test: [:spec, :cucumber]

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = [FileList['spec/**/*_spec.rb'], "#{File.join(Gem.loaded_specs['activeadmin-core'].gem_dir, 'spec')}/**/*_spec.rb"]
end

require 'cucumber/rake/task'

task cucumber: [:"cucumber:regular", :"cucumber:reloading"]

namespace :cucumber do

  Cucumber::Rake::Task.new(:regular, "Run the standard cucumber scenarios") do |t|
    t.profile = 'default'
    t.bundler = false
  end

  Cucumber::Rake::Task.new(:reloading, "Run the cucumber scenarios that test reloading") do |t|
    t.profile = 'class-reloading'
    t.bundler = false
  end

end
