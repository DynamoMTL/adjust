require 'roar/json'

module Adjust
  module Representers
    module EventRepresenter
      include Roar::JSON
      include Roar::Hypermedia

      # Request Properties
      property :app_token
      property :event_token
      property :created_at
      property :idfa
      property :s2s

      # Response Properties
      property :tracker_token
      property :tracker_name
      property :network
      property :country
    end
  end
end
