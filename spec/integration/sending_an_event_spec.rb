require 'spec_helper'

describe 'Sending an event' do
  context 'with success', vcr: { cassette_name: :event_success }  do
    subject { Adjust.event(token: 'tawmb9', idfa: ENV['ADJUST_TEST_IDFA']) }

    it 'succeeds' do
      expect(subject.track!).to be_success
    end
  end
end
