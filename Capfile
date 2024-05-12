# frozen_string_literal: true

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/passenger'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

require 'capistrano/linked_files'
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
