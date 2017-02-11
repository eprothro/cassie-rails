module CassieRails
  class Railtie < ::Rails::Railtie

    initializer "cassie-rails.set_env" do
      Cassie.env = Rails.env
    end
  end
end
