# RVM bootstrap
set :rvm_ruby_string, '1.9.2-p136@warranties'
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                               # Load RVM's capistrano plugin.

# When using whenever gem:
# set :whenever_command, "bundle exec whenever"
# require 'whenever/capistrano'

set :rvm_type, :user

# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "warranties"
role :web, "patrick.kabisa.nl"
role :app, "patrick.kabisa.nl"
role :db,  "patrick.kabisa.nl", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/warranties"
set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false

# repo details
set :scm, :git
set :scm_username, "passenger"
set :repository, "git@github.com:bazzel/warranties.git"
set :branch, "master"
set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

load 'deploy/assets'
