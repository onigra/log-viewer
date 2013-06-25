set :application, "log_viwer"
set :user, "root"
#set :use_sudo, false

set :scm, :git
set :branch, "master"
set :repository,  "/Users/taketake3280467/job/log_viewer"
set :deploy_via, :copy
set :deploy_to, "/var/tool/"

role :web, "192.168.50.16"
role :app, "192.168.50.16"
role :db,  "192.168.50.16", :primary => true
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

