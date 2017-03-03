# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Compile frontend assets"
task :sasscompile do
  puts "Compiling frontend assets"
  system("bundle exec sass --watch canboard-frontend/src/sass/site.scss:canboard-frontend/resources/public/css/site.css")
end
