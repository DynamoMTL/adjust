require 'roar/transport/faraday'

module Adjust
  module Transport
    class Faraday < Roar::Transport::Faraday
      private

      def build_connection(uri, _)
        ::Faraday.new(url: uri) do |connection|
          connection.request :url_encoded
          connection.response :fail_hard
          connection.adapter ::Faraday.default_adapter
        end
      end
    end
  end
end
