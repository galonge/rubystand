set :application, "rubystand"
set :domain,      "vova.org"
set :use_sudo,    false
set :deploy_to,   "/rails/#{application}"
set :user,        "root"
default_run_options[:pty] = true

set :scm, :none
set :deploy_via, :copy
set :repository,  "."
set :copy_exclude, [".git", ".svn", ".DS_Store", "tmp/*", "log/*", "._*", "public/data"]

role :app, domain
role :web, domain
role :db,  domain, :primary => true

#load 'deploy/assets'

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

after "deploy", :links
after "deploy", "deploy:cleanup"

desc "Links"
task :links do
  run "ln -nfs #{deploy_to}/shared/data #{release_path}/public/data"
end

