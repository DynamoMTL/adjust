require 'ostruct'
require 'roar/json'
require 'roar/client'

module Adjust
  module Clients
    class Event < OpenStruct
      include Roar::JSON
      include Representers::EventRepresenter
      include Roar::Client

      def initialize(**args)
        super args.merge(s2s: 1)
      end
    end
  end
end
