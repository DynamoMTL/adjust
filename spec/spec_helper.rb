require 'dotenv'
require 'json'
require 'pry'
require 'bundler/setup'
require 'webmock/rspec'

Bundler.setup
Dotenv.load!

require 'adjust'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, 'https://s2s.adjust.com/event')
      .to_return body: {
        tracker_token: :tracker_token,
        tracker_name: :organic,
        network: :organic,
        country: :ca
      }.to_json
  end
end
