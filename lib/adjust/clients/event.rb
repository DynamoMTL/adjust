require 'ostruct'
require 'roar/json'
require 'roar/client'

module Adjust
  module Clients
    class Event < OpenStruct
      include Roar::JSON
      include Roar::Client
      include Representers::EventRepresenter

      def initialize(**args)
        super args.merge(s2s: 1)
      end

      def serialize
        to_hash
      end
    end
  end
end
