require "generator_spec"
require "./lib/cassie_rails/railties/generators/cassandra/config/config_generator"
require "cassie/tasks"

RSpec.describe Cassandra::ConfigGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)
  arguments []

  before(:all) do
    prepare_destination
  end

  it "runs configuration:generate command" do
      generator = double(save: true)
      expect_any_instance_of(Cassie::Tasks::TaskRunner).to receive(:run_command) do |_obj, args|
        expect(args[0]).to eq("configuration:generate")
      end

      run_generator
  end
  it "passes expanded config path to Task Runner" do
      expect_any_instance_of(Cassie::Tasks::TaskRunner).to receive(:run_command) do |_obj, args|
        expect(args).to include("--path")
        expect(args).to include(File.expand_path("config/cassandra.yml"))
      end

      run_generator
    end
  context "when rails application is defined" do
    before(:each) do
      module Rails; def self.application; end; end
      allow(Rails).to receive(:application){double(class: double(parent_name: "CassieRails"))}
    end
    it "passes app name to Task Runner" do
      expect_any_instance_of(Cassie::Tasks::TaskRunner).to receive(:run_command) do |_obj, args|
        expect(args).to include("--name")
        expect(args).to include("cassie_rails")
      end

      run_generator
    end
  end
end