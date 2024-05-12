server 'todos.up.km.ua', user: 'deployer', roles: %w{web app db}, port: 32015
set :branch, 'master'
set :rails_env, :production
set :stage , :production
set :sidekiq_env, :production
set :deploy_to, '/home/deployer/apps/todos.up.km.ua'
