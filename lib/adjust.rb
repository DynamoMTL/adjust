require 'faraday'
require 'adjust/version'

module Adjust
  autoload :Core, 'adjust/core'
  autoload :Clients, 'adjust/clients'
  autoload :Representers, 'adjust/representers'
  autoload :Transport, 'adjust/transport'

  class << self
    include Core::Configurable

    def event(app:, event:, time: current_time, **device)
      Clients::Event.new(
        **tokens(app, event),
        environment: environment,
        created_at: time,
        **device)
    end

    def revenue(app:, event:, revenue:, currency:, time: current_time, **device)
      Clients::Revenue.new(
        **tokens(app, event),
        environment: environment,
        created_at: time,
        revenue: revenue,
        currency: currency,
        **device)
    end

    def current_time
      return Time.zone.now.iso8601 if Time.respond_to? :zone

      Time.now.utc.iso8601
    end
  end
end
