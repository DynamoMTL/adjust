require 'spec_helper'

describe 'Sending an event' do
  context 'with success', vcr: { cassette_name: :event_success }  do
    subject do
      Adjust.event \
        app: 'test_app',
        event: 'event1',
        idfa: ENV['ADJUST_TEST_IDFA']
    end

    it 'succeeds' do
      expect(subject.track!).to be_success
    end
  end
end
