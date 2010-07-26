Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end

def remove_task(task_name)
  Rake.application.remove_task(task_name)
end

remove_task :test
task :test do
  puts "\nRunning RSpec tests"
  Rake::Task["spec"].invoke rescue got_error = true
  puts "\nRunning Cucumber tests"
  Rake::Task["cucumber"].invoke rescue got_error = true
  raise "Test failures" if got_error
end