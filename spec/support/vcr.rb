require 'vcr'
require 'timecop'

VCR.configure do |config|
  config.filter_sensitive_data('<ADJUST_APP_TOKEN>') do
    ENV.fetch('ADJUST_APP_TOKEN')
  end

  config.filter_sensitive_data('<ADJUST_TEST_IDFA>') do
    ENV.fetch('ADJUST_TEST_IDFA')
  end

  config.cassette_library_dir = 'spec/fixtures/responses'

  config.default_cassette_options = {
    match_requests_on: [:method, :uri, :body]
  }

  config.configure_rspec_metadata!
  config.hook_into :webmock
end

module CassetteTime
  def recording?
    VCR.current_cassette
  end

  def recorded_at
    VCR.current_cassette.originally_recorded_at
  end
end

RSpec.configure do |config|
  config.include CassetteTime

  config.before(:each) do
    Timecop.freeze(recorded_at) if recording?
  end

  config.after(:each) do
    Timecop.return
  end

  def named(name)
    { cassette_name: name }
  end
end
