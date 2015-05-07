module Adjust
  module Core
    class Tokens
      def initialize(app, event, config)
        @app = app
        @event = event
        @config = config
      end

      def find
        { app_token: app_token, event_token: event_token }
      end

      private

      attr_reader :app, :event, :config

      def app_token
        return app unless config

        config.fetch('app_token') { app }
      end

      def event_token
        return event unless config

        if config.include?(event)
          config[event].fetch('event_token') { event }
        else
          event
        end
      end
    end
  end
end
