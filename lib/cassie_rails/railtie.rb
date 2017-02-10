module CassieRails
  class Railtie < ::Rails::Railtie

    generators do
      Dir[File.expand_path("railties/**/*_generator.rb", File.dirname(__FILE__))].each do |file|
        require file
      end
    end

    initializer "cassie-rails.set_env" do
      Cassie.env = Rails.env
    end

    rake_tasks do
      require 'cassie/tasks'
    end
  end
end
