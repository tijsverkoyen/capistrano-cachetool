namespace :cachetool do
  desc <<-DESC
    Installs cachetool.phar to the shared directory
    In order to use the .phar file, the cachetool command needs to be mapped:
      SSHKit.config.command_map[:cachetool] = "\#{shared_path.join("cachetool.phar")}"
    This is best used after deploy:starting:
      namespace :deploy do
        after :starting, 'cachetool:install_executable'
      end
  DESC
  task :install_executable do
    on release_roles(fetch(:cachetool_roles)) do
      within shared_path do
        if test "[", "!", "-e", "cachetool.phar", "]"
          execute :curl, "-sO", fetch(:cachetool_download_url)
          execute :chmod, "+x", "cachetool.phar"
        end
      end
    end
  end

  desc <<-DESC
    Access a cachetool command directly
    This tasks allows access to any cachetool command.
  DESC
  task :run, :command do |t, args|
    args.with_defaults(:command => :list)
    on release_roles(fetch(:cachetool_roles)) do
      within fetch(:cachetool_working_dir) do
        execute :cachetool, args[:command], *args.extras
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :cachetool_roles, :all
    set :cachetool_download_url, "https://gordalina.github.io/cachetool/downloads/cachetool.phar"
    set :cachetool_working_dir, -> { fetch(:release_path) }
  end
end
