require 'spec_helper'

module Adjust
  module Clients
    describe Event do
      subject(:event) do
        Event.new(
          app_token: :app_token,
          event_token: :event_token,
          created_at: :timestamp,
          idfa: :idfa
        )
      end

      it "has a s2s value that's always equal to 1" do
        expect(event.s2s).to be 1
      end

      context 'response' do
        subject!(:response) do
          event.post \
            uri: 'https://s2s.adjust.com/event',
            as: 'application/json'
        end

        it 'acts as an http client' do
          expect(post_request).to have_been_made
        end

        it 'updates event with response tracker token' do
          expect(response.tracker_token).to eq 'tracker_token'
        end

        def post_request
          a_request :post, 'https://s2s.adjust.com/event'
        end
      end
    end
  end
end
