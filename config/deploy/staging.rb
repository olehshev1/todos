server 'staging.todos.up.km.ua', user: 'deployer',  roles: %w{web app db}, port: 32015
set :branch, 'staging'
set :rails_env, 'staging'
set :stage, 'staging'
set :sidekiq_env, 'staging'
set :deploy_to, '/home/deployer/apps/staging.todos.up.km.ua'
