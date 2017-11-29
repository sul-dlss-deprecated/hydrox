require 'rspec/core/rake_task'
require 'rubocop/rake_task'

desc 'Run style checker'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.fail_on_error = true
end

RSpec::Core::RakeTask.new(:spec)

desc 'Spin up test servers and run specs'
task :spec_with_app_load do
  require 'solr_wrapper'   # necessary for rake_support to work
  require 'fcrepo_wrapper' # necessary for rake_support to work
  require 'active_fedora/rake_support'

  with_test_server do
    ## Rake::Task['hyrax:default_admin_set:create'].invoke
    Rake::Task['spec'].invoke
  end
end

desc 'Run continuous integration tests'
task ci: [:rubocop] do
  puts 'running continuous integration'
  Rake::Task['spec_with_app_load'].invoke
end
