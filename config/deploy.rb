require "bundler/capistrano"

set :application, "hackzombie"
set :repository,  "git@github.com:hackzombie/hackzombie.git"
set :user, "ubuntu" 

ssh_options[:forward_agent] = true

set :branch, "master"

set :deploy_via, :remote_cache

set :git_enable_submodules, 1

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "107.22.208.242" # Your HTTP server, Apache/etc
role :app, "107.22.208.242" # This may be the same as your `Web` server
role :db,  "107.22.208.242", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/ubuntu/deploy"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
#namespace :deploy do
#  task :start do ; end
#  task :stop do ; end
#  task :restart, :roles => :app, :except => { :no_release => true } do
#    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#  end
#end