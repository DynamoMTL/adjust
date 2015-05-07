module Adjust
  module Core
    module Configurable
      def load(path = 'config/adjust.yml', environment: nil)
        configuration.load path, environment: environment
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
