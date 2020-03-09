require 'cookstyle'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'kitchen/rake_tasks'
require 'foodcritic'

RuboCop::RakeTask.new do |task|
  task.options << '--display-cop-names'
end

FoodCritic::Rake::LintTask.new do |foodcritic|
  foodcritic.options[:fail_tags] = %w(any)
end

RSpec::Core::RakeTask.new do |rspec|
  rspec.rspec_opts = '--color --format documentation'
end

Kitchen::RakeTasks.new

task default: :all

desc 'Run all tests'
task all: [:test, 'kitchen:all']

desc 'Run all style checks and unit tests'
task test: [:style, :spec]

desc 'Run Rubocop and Foodcritic style checks'
task style: [:rubocop, :foodcritic]
