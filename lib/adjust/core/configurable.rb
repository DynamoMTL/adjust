module Adjust
  module Core
    module Configurable
      extend Forwardable

      def configure
        yield configuration
      end

      def configuration
        @configuration ||= Configuration.new
      end

      private

      def_delegators :configuration, :app_token, :environment
    end
  end
end
