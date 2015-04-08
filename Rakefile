# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rspec/core/rake_task'
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Run the specs"
if  Rails.env == "development" || Rails.env == "test"
  RSpec::Core::RakeTask.new(:spec)
end

task :default  => :spec
