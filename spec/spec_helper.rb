require 'json'
require 'pry'
require 'bundler/setup'
require 'webmock/rspec'

Bundler.setup

ENV['ADJUST_APP_TOKEN'] = 'app-token'
ENV['ADJUST_TEST_IDFA'] = 'test-idfa'

require 'adjust'
require 'support/vcr'

Adjust.load('spec/fixtures/config/adjust.yml', environment: 'integration')
