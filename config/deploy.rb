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
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
set :rvm_ruby_string, 'ruby-1.9.3'
set :rvm_bin_path, '/usr/local/rvm/bin'
set :rvm_type, :system

set :keep_releases, 3

#before 'deploy', 'rvm1:install:rvm'  # install/update RVM

namespace :deploy do

  # desc 'Restart application'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     # Your restart mechanism here, for example:
  #     execute :touch, release_path.join('tmp/restart.txt')
  #   end
  # end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end



require 'tempfile'

require 'capistrano'
require 'capistrano/version'

require 'capistrano-unicorn/config'
require 'capistrano-unicorn/utility'

module CapistranoUnicorn
  class CapistranoIntegration
    TASKS = [
      'unicorn:start',
      'unicorn:stop',
      'unicorn:restart',
      'unicorn:duplicate',
      'unicorn:reload',
      'unicorn:shutdown',
      'unicorn:add_worker',
      'unicorn:remove_worker',
      'unicorn:show_vars',
    ]

    def self.load_into(capistrano_config)
      capistrano_config.load do

        before(CapistranoIntegration::TASKS) do
          Config.load(self)
        end

        extend Utility

        #
        # Unicorn cap tasks
        #
        namespace :unicorn do
          desc 'Debug Unicorn variables'
          task :show_vars, :roles => :app do
            puts <<-EOF.gsub(/^ +/, '')

              # Environments
              rails_env          "#{rails_env}"
              unicorn_env        "#{unicorn_env}"
              unicorn_rack_env   "#{unicorn_rack_env}"

              # Execution
              unicorn_user       #{unicorn_user.inspect}
              unicorn_bundle     "#{unicorn_bundle}"
              unicorn_bin        "#{unicorn_bin}"
              unicorn_options    "#{unicorn_options}"
              unicorn_restart_sleep_time  #{unicorn_restart_sleep_time}

              # Relative paths
              app_subdir                         "#{app_subdir}"
              unicorn_config_rel_path            "#{unicorn_config_rel_path}"
              unicorn_config_filename            "#{unicorn_config_filename}"
              unicorn_config_rel_file_path       "#{unicorn_config_rel_file_path}"
              unicorn_config_stage_rel_file_path "#{unicorn_config_stage_rel_file_path}"

              # Absolute paths
              app_path                  "#{app_path}"
              unicorn_pid               "#{unicorn_pid}"
              bundle_gemfile            "#{bundle_gemfile}"
              unicorn_config_path       "#{unicorn_config_path}"
              unicorn_config_file_path  "#{unicorn_config_file_path}"
              unicorn_config_stage_file_path
              ->                        "#{unicorn_config_stage_file_path}"
            EOF
          end

          desc 'Start Unicorn master process'
          task :start, :roles => unicorn_roles, :except => {:no_release => true} do
            run start_unicorn
          end

          desc 'Stop Unicorn'
          task :stop, :roles => unicorn_roles, :except => {:no_release => true} do
            run kill_unicorn('QUIT')
          end

          desc 'Immediately shutdown Unicorn'
          task :shutdown, :roles => unicorn_roles, :except => {:no_release => true} do
            run kill_unicorn('TERM')
          end

          desc 'Restart Unicorn'
          task :restart, :roles => unicorn_roles, :except => {:no_release => true} do
            run <<-END
              #{duplicate_unicorn}

              sleep #{unicorn_restart_sleep_time}; # in order to wait for the (old) pidfile to show up

              if #{old_unicorn_is_running?}; then
                #{unicorn_send_signal('QUIT', get_old_unicorn_pid)};
              fi;
            END
          end

          desc 'Duplicate Unicorn'
          task :duplicate, :roles => unicorn_roles, :except => {:no_release => true} do
            run duplicate_unicorn()
          end

          desc 'Reload Unicorn'
          task :reload, :roles => unicorn_roles, :except => {:no_release => true} do
            run <<-END
              if #{unicorn_is_running?}; then
                echo "Reloading Unicorn...";
                #{unicorn_send_signal('HUP')};
              else
                #{start_unicorn}
              fi;
            END
          end
        end
      end
    end
  end
end
