module Adjust
  module Core
    class Configuration
      attr_accessor :app_token, :environment

      def environment
        @environment ||= :sandbox
      end

      def app_token
        fail MissingAppTokenError unless @app_token

        @app_token
      end

      def to_hash
        {
          environment: environment,
          app_token: app_token
        }
      end
    end
  end
end
