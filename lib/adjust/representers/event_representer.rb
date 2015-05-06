require 'roar/json'

module Adjust
  module Representers
    module EventRepresenter
      include Roar::JSON
      include Roar::Hypermedia

      # Event Properties
      property :app_token
      property :event_token
      property :created_at
      property :idfa
      property :s2s
      property :environment

      # Optional Revenue Properties
      property :revenue
      property :currency

      # Response Properties
      property :status

      def success?
        status == 'OK'
      end
    end
  end
end
