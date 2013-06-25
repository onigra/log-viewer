# cap deploy時に自動で bundle installを実行
require "bundler/capistrano"
set :bundle_flags, "--no-deployment --without test development"

# 過去のデプロイしたフォルダを履歴として保持する数
set :keep_releases, 5

# アプリケーション名
set :application, "log_viewer"

# gitリポジトリの設定
set :scm, :git
set :repository,  "/Users/taketake3280467/job/#{application}"
set :branch, "master"
set :deploy_via, :copy

# デプロイ先サーバの設定
set :use_sudo, false
set :user, "vagrant"
set :user_group, "vagrant"
set :deploy_to, "/var/tool/#{application}"
set :rails_env, "production"

# role ========================================
role :web, "maria"
role :app, "maria"
role :db,  "maria", :primary => true

# maintenance ==================================
# turnoutと連携したデプロイ中のメンテナンス表示切り替え
namespace :maintenance do
  desc "Maintenance start"
  task :on, :roles => :web do
    on_rollback { run "rm #{current_path}/tmp/maintenance.yml" }
    page = File.read("config/maintenance.yml")
    put page, "#{current_path}/tmp/maintenance.yml", :mode => 0644
  end

  desc "Maintenance stop"
  task :off, :roles => :web do
    run "rm #{current_path}/tmp/maintenance.yml"
  end
end

# setup ========================================
# セットアップ後のuser.group変更
namespace :setup do
  task :fix_permissions do
    sudo "chown -R #{user}.#{user} #{deploy_to}"
  end
end

after "deploy:setup", "setup:fix_permissions"

# webrick =========================================
namespace :deploy do
  task :start, :roles => :app do
    run "cd #{current_path} && RAILS_ENV=production bundle exec script/rails server -d"
  end

  task :restart, :roles => :app do
    run "cd #{current_path} && kill -TERM `cat tmp/pids/server.pid`"
    run "cd #{current_path} && RAILS_ENV=production bundle exec script/rails server -d"
  end

  task :stop, :roles => :app do
    run "cd #{current_path} && kill -TERM `cat tmp/pids/server.pid`"
  end
end

# deploy ========================================
after :deploy, "maintenance:on"
after :deploy, "deploy:migrate"
after :deploy, "maintenance:off"
after :deploy, "deploy:restart"
after :deploy, "deploy:cleanup"

