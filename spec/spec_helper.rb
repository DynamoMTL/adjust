require 'dotenv'
require 'json'
require 'pry'
require 'bundler/setup'
require 'webmock/rspec'

Bundler.setup
Dotenv.load

require 'adjust'
require 'support/vcr'

Adjust.load('spec/fixtures/config/adjust.yml', environment: 'integration')
