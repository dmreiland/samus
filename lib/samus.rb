require_relative './samus/deployer'
require_relative './samus/builder'
require_relative './samus/command'

module Samus
  module_function

  def load_commands
    if command_path = ENV['SAMUS_COMMAND_PATH']
      command_path.split(':').each do |path|
        plugin_file = File.join(path, 'plugin.rb')
        require(plugin_file) if File.exist?(plugin_file)
        Samus::Command.command_paths << path
      end
    end
  end
end