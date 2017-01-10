module Adjust
  module Core
    module Configurable
      def load(path = 'config/adjust.yml', config: nil, environment: nil)
        configuration.load path, config: config, environment: environment
      end

      def configuration
        @configuration ||= Configuration.new
      end

      private

      def environment
        configuration.active_environment
      end

      def tokens(app, event)
        configuration.tokens(app, event)
      end
    end
  end
end
