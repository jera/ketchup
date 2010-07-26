Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end

def remove_task(task_name)
  Rake.application.remove_task(task_name)
end

# Override existing test task to prevent integrations
# from being run unless specifically asked for
remove_task :test
task :test do
  puts 'Running RSpec tests'
  Rake::Task["spec"].invoke rescue got_error = true
  puts 'Running Cucumber tests'
  Rake::Task["cucumber"].invoke rescue got_error = true
  raise "Test failures" if got_error
end