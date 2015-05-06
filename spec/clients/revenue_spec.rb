require 'spec_helper'

module Adjust
  module Clients
    describe Revenue do
      let(:idfa) { ENV['ADJUST_TEST_IDFA'] }
      let(:app_token) { ENV['ADJUST_APP_TOKEN'] }
      let(:endpoint) { 'https://s2s.adjust.com/revenue' }

      subject(:revenue) { Revenue.new(**revenue_params) }

      before do
        stub_request(:post, endpoint)
          .to_return(body: '{"status":"OK"}')
      end

      describe '#track!' do
        subject(:track!) { revenue.track! }

        it 'makes a post request to adjust' do
          track!

          expect(a_post_request).to have_been_made
        end

        it 'updates revenue with status returned' do
          expect(track!).to be_success
        end

        def a_post_request
          a_request(:post, endpoint)
            .with(body: hash_including(revenue_params))
        end

        def revenue_params
          {
            idfa: idfa,
            app_token:  app_token,
            event_token: 'fbv8to',
            created_at: Time.now.iso8601,
            revenue: '1.5',
            currency: 'CAD',
            environment: 'sandbox'
          }
        end
      end
    end
  end
end
