require_relative "lib/cassie_rails/version"

Gem::Specification.new do |s|
  s.name        = 'cassie-rails'
  s.version     = Cassie::Rails::VERSION
  s.summary     = "Rails Integration for Apache Cassandra application support"
  s.description = <<-EOS.strip.gsub(/\s+/, ' ')
    Rails application support for Apache Cassandra using the the official `cassandra-driver`.
    Provides cluster configration, versioned migrations, efficient session management,
    and a class-based query DSL. Easy to use with lightweight, component-style interfaces.
  EOS
  s.authors     = ["Evan Prothro"]
  s.email       = 'evan.prothro@gmail.com'
  s.files      += Dir['lib/**/*.*']
  s.homepage    = 'https://github.com/eprothro/cassie-rails'
  s.license     = 'MIT'

  s.add_runtime_dependency 'cassie', '~> 1.1.0', ">= 1.1.1"
  s.add_runtime_dependency 'rails', '>= 3.2'

  s.executables << "cassie-rails"

  s.add_development_dependency "bundler", "~> 1.10"
end