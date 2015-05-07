require 'spec_helper'

module Adjust
  module Core
    describe Configuration do
      let(:path) { 'spec/fixtures/config/adjust.yml' }
      subject(:config) { Configuration.new }

      context 'with an explicit environment' do
        subject(:load!) { config.load(path, environment: 'test') }
        before { expect { load! }.to_not raise_error }

        describe '#load' do
          it 'sets an environment' do
            expect(config.environment).to eq 'test'
          end
        end

        describe '#configurations' do
          it 'caches the configurations' do
            expect(config.configurations).to include 'test'
          end
        end

        describe '#active' do
          it 'contains the configuration for current env' do
            expect(config.active).to include 'test_app'
          end
        end

        describe '#active_environment' do
          it 'returns the adjust environment for current env' do
            expect(config.active_environment).to eq 'sandbox'
          end
        end

        describe '#active_tokens' do
          it 'returns arguments if app was not matched' do
            expect(config.tokens('foo', 'bar')).to eq \
              app_token: 'foo',
              event_token: 'bar'
          end

          it 'returns app_token if app matched and event not matched' do
            expect(config.tokens('test_app', 'bar')).to eq \
              app_token: 'app_token',
              event_token: 'bar'
          end

          it 'returns tokens if app matched and event matched' do
            expect(config.tokens('test_app', 'event1')).to eq \
              app_token: 'app_token',
              event_token: 'event_token'
          end
        end
      end
    end
  end
end
