require 'ostruct'
require 'roar/json'
require 'roar/client'

module Adjust
  module Clients
    class Base < OpenStruct
      include Roar::JSON
      include Roar::Client

      attr_writer :transport_engine

      def serialize
        to_hash
      end

      def transport_engine
        @transport_engine || Transport::Faraday
      end
    end
  end
end
