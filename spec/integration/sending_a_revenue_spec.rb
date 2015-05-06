require 'spec_helper'

describe 'Sending an event' do
  context 'with success', vcr: { cassette_name: :revenue_success }  do
    subject do Adjust.revenue \
      token: 'tawmb9',
      revenue: 2.0,
      currency: 'CAD',
      idfa: ENV['ADJUST_TEST_IDFA']
    end

    it 'succeeds' do
      expect(subject.track!).to be_success
    end
  end
end
