# Capistrano::Cachetool

Exposes the [Cachetool by Goralina](http://gordalina.github.io/cachetool/) in Capistrano 3.x


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-cachetool'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-cachetool


## Usage

Require the module in your Capfile:

require 'capistrano/cachetool'
capistrano/cachetool comes with 2 tasks:

* `cachetool:install_executable`
* `cachetool:run`

By default it is assumed that you have the cachetool executable installed and in your $PATH on all target hosts.

### Configuration

Configurable options, shown here with defaults:

```
set :cachetool_roles, :all
set :cachetool_download_url, "https://gordalina.github.io/cachetool/downloads/cachetool.phar"
set :cachetool_working_dir, -> { fetch(:release_path) }
```

### Installing cachetool as part of a deployment

Add the following to deploy.rb to manage the installation of cachetool during deployment (cachetool.phar is install in the shared path).

```
SSHKit.config.command_map[:cachetool] = "php #{shared_path.join("cachetool.phar")}"

namespace :deploy do
  after :starting, 'cachetool:install_executable'
end
```

### Accessing cachetool commands directly

This library also provides a `cachetool:run` task which allows access to any `cachetool` command.

From the command line you can run

```
cap production cachetool:run['opcache:status', '--cli']
```

If you use zsh you will need to wrap the command in quotes:

```
cap production "cachetool:run['opcache:status', '--cli']" 
```

Or from within a rake task using capistrano's invoke

```
task :my_custom_cachetool_task do
  invoke "cachetool:run", :update, "--dev --prefer-dist"
end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/tijsverkoyen/capistrano-cachetool/issues](https://github.com/tijsverkoyen/capistrano-cachetool/issues).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
