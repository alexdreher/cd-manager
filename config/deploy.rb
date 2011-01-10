set :application, "cd-manager"
set :server_name, "lxmedia.net"

set :scm, :git
set :repository,  "git://github.com/alexdreher/cd-manager.git"
set :branch, "master"

set :user, "alexdreher"
set :deploy_to, "/var/apps/testbox/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

role :web, server_name
role :app, server_name
role :db,  server_name, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    #run "ln -nfs #{shared_path}/public #{release_path}/public"
  end
end