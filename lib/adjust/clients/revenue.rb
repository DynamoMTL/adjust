module Adjust
  module Clients
    class Revenue < Base
      include Representers::EventRepresenter

      def initialize(**args)
        super args.merge(s2s: 1)
      end

      def track!
        post uri: 'https://s2s.adjust.com/revenue'
      end
    end
  end
end
