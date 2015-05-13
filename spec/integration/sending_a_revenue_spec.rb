require 'spec_helper'

describe 'Sending a revenue' do
  context 'with success', vcr: named(:revenue_success)  do
    subject do
      Adjust.revenue \
        app: :test_app,
        event: :event2,
        revenue: 2.0,
        currency: 'CAD',
        idfa: ENV['ADJUST_TEST_IDFA']
    end

    it 'succeeds' do
      expect(subject.track!).to be_success
    end
  end

  context 'with unknown device', vcr: named(:revenue_unknown_device) do
    subject do
      Adjust.revenue \
        app: :test_app,
        event: :event2,
        revenue: 2.0,
        currency: 'CAD',
        idfa: 'D2CADB5F-410F-4963-AC0C-2A78534BDF1E'
    end

    it 'raises an error' do
      expect { subject.track! }.to raise_error \
        Adjust::Transport::Error, /Device not found/
    end
  end
end
