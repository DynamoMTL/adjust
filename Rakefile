require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:linting)

desc 'Linting & Specs'
task verify: %w(linting spec)

task default: :verify
