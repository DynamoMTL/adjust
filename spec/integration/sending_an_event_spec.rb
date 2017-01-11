require 'spec_helper'

describe 'Sending an event' do
  context 'with success', vcr: named(:event_success) do
    subject do
      Adjust.event \
        app: :test_app,
        event: :event1,
        idfa: ENV['ADJUST_TEST_IDFA']
    end

    it 'succeeds' do
      expect(subject.track!).to be_success
    end
  end

  context 'with unknown device', vcr: named(:event_unknown_device) do
    subject do
      Adjust.event \
        app: :test_app,
        event: :event1,
        idfa: 'D2CADB5F-410F-4963-AC0C-2A78534BDF1E'
    end

    it 'raises an error' do
      expect { subject.track! }.to raise_error \
        Adjust::Transport::Error, /Device not found/
    end
  end
end
