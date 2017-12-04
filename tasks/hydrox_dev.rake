begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  desc 'Run style checker'

  RuboCop::RakeTask.new(:rubocop) do |task|
    task.fail_on_error = true
  end

  desc 'Run continuous integration tests'
  task ci: [:rubocop] do
    puts 'running continuous integration'
    with_test_server do
      Rake::Task['spec'].invoke
    end
  end
rescue LoadError
end
