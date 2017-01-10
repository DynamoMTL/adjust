require 'yaml'
require 'erb'

module Adjust
  module Core
    class Configuration
      def load(path, config: nil, environment: nil)
        @environment = environment || default_environment
        @configurations = config || read_configurations(path)
      end

      def environment
        @environment ||= default_environment
      end

      def configurations
        @configurations ||= read_configurations
      end

      def active
        configurations[environment]
      end

      def active_environment
        active['environment']
      end

      def tokens(app, event)
        Tokens.new(app, event, active).find
      end

      private

      def default_environment
        ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
      end

      def read_configurations(path = 'config/adjust.yml')
        YAML.load parse read path
      end

      def read(path)
        File.read path
      end

      def parse(file)
        ERB.new(file).result
      end
    end
  end
end
