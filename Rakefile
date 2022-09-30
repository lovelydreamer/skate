# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require 'annotations/rake_task'

Rails.application.load_tasks

Annotations::RakeTask.new do |t|
    t.tags = [:fixme, :optimize, :todo, :insecure, :security]
end