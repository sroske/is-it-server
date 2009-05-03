branch = ENV['BRANCH'] || "master"

default_run_options[:pty] = true

set :application, "is-it"
set :user, "sroske"
set :scm, "git"
set :repository,  "git@github.com:sroske/is-it-server.git"
set :branch, branch
set :deploy_to, "/var/sites/#{application}"

role :app, "is-it.bitgun.com"
role :web, "is-it.bitgun.com"
role :db,  "is-it.bitgun.com", :primary => true

namespace :deploy do
  [:start, :restart].each do |default_task|
    task default_task do 
      # ... ahh, silence!
    end
  end
end

namespace :dirtytourney do
  desc "Adds a symlink for the data directory"
  task :backups do
    run "ln -s #{shared_path}/data #{current_path}/data"
  end
end

after :deploy, "dirtytourney:backups"


namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"
