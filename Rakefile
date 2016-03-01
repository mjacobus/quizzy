# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require "rake"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_spec.rb"
  t.libs    << "test"
end

namespace :test do
  task :coveralls do
    ENV["COVERALLS"] = "true"
    Rake::Task["test:coverage"].invoke
  end

  task :coverage do
    ENV["COVERAGE"] = "true"
    Rake::Task["test"].invoke
  end

  task :scrutinizer do
    ENV["SCRUTINIZER"] = "true"
    Rake::Task["test"].invoke
  end
end

# task default: :test
# task spec: :test
