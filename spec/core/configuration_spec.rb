require 'spec_helper'

module Adjust
  module Core
    describe Configuration do
      context '#environment' do
        it 'defaults to sandbox' do
          expect(subject.environment).to eq :sandbox
        end

        it 'can be overriden' do
          subject.environment = :production

          expect(subject.environment).to eq :production
        end
      end

      context '#app_token' do
        it 'raises an exception if not set' do
          expect { subject.app_token }.to raise_error(MissingAppTokenError)
        end

        it 'can be set' do
          subject.app_token = :app_token

          expect(subject.app_token).to eq :app_token
        end
      end

      context '#to_hash' do
        before { subject.app_token = :app_token }

        it 'returns configs as a hash' do
          expect(subject.to_hash).to eq \
            environment: :sandbox,
            app_token: :app_token
        end
      end
    end
  end
end
