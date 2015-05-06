module Adjust
  module Clients
    class Event < Base
      include Representers::EventRepresenter

      def initialize(**args)
        super args.merge(s2s: 1)
      end
    end
  end
end
