require 'spec_helper'

module Adjust
  module Clients
    describe Event do
      let(:idfa) { ENV['ADJUST_TEST_IDFA'] }
      let(:app_token) { ENV['ADJUST_APP_TOKEN'] }

      subject(:event) do
        Event.new(
          idfa: idfa,
          app_token: app_token,
          event_token: 'tawmb9',
          created_at: Time.now.iso8601,
          environment: :sandbox
        )
      end

      it "has a s2s value that's always equal to 1" do
        expect(event.s2s).to be 1
      end

      context 'response', vcr: { cassette_name: :event_success } do
        subject!(:response) do
          event.post uri: 'https://s2s.adjust.com/event'
        end

        it 'makes a post request to adjust' do
          expect(post_request).to have_been_made
        end

        it 'updates event with response tracker token' do
          expect(response).to be_success
        end

        def post_request
          a_request :post, 'https://s2s.adjust.com/event'
        end
      end
    end
  end
end
