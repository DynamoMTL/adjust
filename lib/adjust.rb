require 'adjust/version'
require 'adjust/transport/faraday'

module Adjust
  autoload :Core, 'adjust/core'
  autoload :Clients, 'adjust/clients'
  autoload :Representers, 'adjust/representers'

  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Core::Configuration.new
    end

    def event(token:, time: current_time, **device)
      Clients::Event.new \
        event_token: token,
        app_token: app_token,
        environment: environment,
        created_at: time,
        **device
    end

    private

    def app_token
      configuration.app_token
    end

    def environment
      configuration.environment
    end

    def current_time
      return Time.zone.now.iso8601 if Time.respond_to? :zone

      Time.now.iso8601
    end
  end
end
