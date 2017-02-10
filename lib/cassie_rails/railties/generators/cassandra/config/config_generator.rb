require 'cassie/tasks'
module Cassandra
  class ConfigGenerator < Rails::Generators::Base

    def create_config
      if File.exist?(config_file_path)
        puts yellow("[skip] '#{file}' already exists")
      else
        puts green("[new] creating '#{file}'")

        Cassie::Tasks::TaskRunner.new
        args = ["configuration:generate"]
        args += ['--name', app_name]
        args += ['--path', config_file_path]

        Cassie::Tasks::TaskRunner.new.run_command(args)
      end
    end

    def finalize
      puts green('[done]')
    end

    private

    def config_file_path
      File.expand_path(file)
    end

    def file
      Cassie.paths["cluster_configurations"]
    end

    def app_name
      if defined?(Rails) && Rails.respond_to?(:application)
        Rails.application.class.parent_name.underscore
      else
        self.class.base_name
      end
    end

    def colorize(color_code, message)
      "\e[#{color_code}m#{message}\e[0m"
    end

    def green(message)
      colorize(32, message)
    end

    def yellow(message)
      colorize(33, message)
    end


  end
end