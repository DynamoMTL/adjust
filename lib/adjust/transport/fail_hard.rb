module Adjust
  module Transport
    class Error < StandardError; end

    class FailHard < ::Faraday::Response::Middleware
      SUCCESS_STATUSES = 200...300

      def on_complete(env)
        fail Error, error_from_json(env[:body]) if failed?(env)
      end

      def failed?(env)
        !SUCCESS_STATUSES.include?(env[:status])
      end

      def error_from_json(body)
        MultiJson.load(body)['error']
      end

      Faraday::Response.register_middleware fail_hard: FailHard
    end
  end
end
