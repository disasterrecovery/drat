set :application, 'drat'
set :repo_url, 'git@github.com:tbeseda/drat.git'

#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, 'master'
set :deploy_to, '/home/rails/drat'
#set :scm, :git
set :format, :pretty
set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
#set :default_env, { rvm_bin_path: '~/.rvm/bin' }
set :rvm_ruby_string, 'ruby-1.9.3'
set :rvm_bin_path, '/home/rails/.rvm/bin'
set :rvm_type, :user

set :keep_releases, 3

#before 'deploy', 'rvm1:install:rvm'  # install/update RVM

namespace :deploy do

  task :start do
    on roles(:app) do
      execute "/etc/init.d/unicorn start"
    end
  end

  task :stop do
    on roles(:app) do
      execute "/etc/init.d/unicorn force-stop"
    end
  end

  task :graceful_stop do
    on roles(:app) do
      execute "/etc/init.d/unicorn stop"
    end
  end

  task :reload do
    on roles(:app) do
      execute "/etc/init.d/unicorn reload"
    end
  end

  task :restart do
    on roles(:app) do
      execute "/etc/init.d/unicorn restart"
    end
  end

end
