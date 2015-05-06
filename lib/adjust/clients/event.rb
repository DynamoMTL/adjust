module Adjust
  module Clients
    class Event < Base
      include Representers::EventRepresenter

      def initialize(**args)
        super args.merge(s2s: 1)
      end

      def track!
        post uri: 'https://s2s.adjust.com/event'
      end
    end
  end
end
