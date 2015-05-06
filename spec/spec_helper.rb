require 'dotenv'
require 'json'
require 'pry'
require 'bundler/setup'
require 'webmock/rspec'

Bundler.setup
Dotenv.load!

require 'adjust'
require 'support/vcr'

Adjust.configure do |config|
  config.app_token = ENV['ADJUST_APP_TOKEN']
end
