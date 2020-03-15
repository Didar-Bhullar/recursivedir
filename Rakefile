namespace :style do
  begin
    require 'cookstyle'
    require 'rubocop/rake_task'
    require 'foodcritic'

    RuboCop::RakeTask.new do |task|
      task.options << '--display-cop-names'
    end

    FoodCritic::Rake::LintTask.new do |foodcritic|
      foodcritic.options[:fail_tags] = %w(any)
    end

    task all_style: [:foodcritic, :rubocop]
  rescue LoadError => e
    puts ">>> Gem Load error: #{e}, ommiting #{task.name}" unless ENV['CI']
  end
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new do |rspec|
    rspec.rspec_opts = '--color --format documentation'
  end
rescue LoadError => e
  puts ">>> Gem Load error: #{e}, ommiting #{task.name}" unless ENV['CI']
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue Kitchen::UserError => e
  puts ">>> Kitchen User error: #{e}, ommiting #{task.name}" unless ENV['CI']
end

desc 'Run style, unit, and integration tests'
task default: ['style_and_spec', 'kitchen:all']

desc 'Run all style checks and unit tests'
task style_and_spec: ['style:all_style', 'spec']

desc 'Run all style checks'
task all_style: 'style:all_style'
