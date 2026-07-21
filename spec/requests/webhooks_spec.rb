require 'rails_helper'

describe 'Webhooks API' do
  let(:openwa_token) { 'owa_k1_test_token' }
  let(:headers) do
    {
      'Authorization' => "Bearer #{openwa_token}",
      'Content-Type' => 'application/json'
    }
  end

  before do
    allow(Rails.application.credentials).to receive(:dig).with(:openwa_token).and_return(openwa_token)
  end

  describe 'POST /api/v1/webhooks/openwa' do
    context 'with valid authentication' do
      context 'message event' do
        let(:payload) do
          {
            event: 'message',
            data: {
              from: '593987654321',
              body: 'Test message',
              id: 'msg_123'
            }
          }
        end

        it 'receives message event successfully' do
          post '/api/v1/webhooks/openwa', params: payload, headers: headers

          expect(response).to have_http_status(:ok)
          expect(response.parsed_body).to eq({ 'success' => true })
        end

        it 'logs webhook event' do
          expect(WebhookEvent).to receive(:create).with(
            hash_including(
              event_type: 'message',
              source_phone: '593987654321'
            )
          )

          post '/api/v1/webhooks/openwa', params: payload, headers: headers
        end
      end

      context 'message status event' do
        let(:payload) do
          {
            event: 'message.status',
            data: {
              id: 'msg_123',
              status: 'delivered',
              to: '593912345678'
            }
          }
        end

        it 'receives message status event successfully' do
          post '/api/v1/webhooks/openwa', params: payload, headers: headers

          expect(response).to have_http_status(:ok)
        end

        it 'logs status update' do
          expect(WebhookEvent).to receive(:create).with(
            hash_including(
              event_type: 'message.status',
              source_phone: '593912345678'
            )
          )

          post '/api/v1/webhooks/openwa', params: payload, headers: headers
        end
      end

      context 'connection event' do
        let(:payload) do
          {
            event: 'connection',
            data: {
              status: 'connected'
            }
          }
        end

        it 'receives connection event successfully' do
          post '/api/v1/webhooks/openwa', params: payload, headers: headers

          expect(response).to have_http_status(:ok)
        end

        it 'logs connection event' do
          expect(WebhookEvent).to receive(:create).with(
            hash_including(event_type: 'connection')
          )

          post '/api/v1/webhooks/openwa', params: payload, headers: headers
        end
      end

      context 'unknown event type' do
        let(:payload) do
          {
            event: 'unknown_event',
            data: {}
          }
        end

        it 'logs unknown event type' do
          allow(Rails.logger).to receive(:info)
          expect(Rails.logger).to receive(:info).with(/Unknown OpenWa event type/)

          post '/api/v1/webhooks/openwa', params: payload, headers: headers
        end

        it 'still returns success' do
          post '/api/v1/webhooks/openwa', params: payload, headers: headers
          expect(response).to have_http_status(:ok)
        end
      end
    end

    context 'without authentication' do
      it 'rejects request without Authorization header' do
        post '/api/v1/webhooks/openwa', params: { event: 'message' }, headers: { 'Content-Type' => 'application/json' }

        expect(response).to have_http_status(:unauthorized)
        expect(response.parsed_body).to eq({ 'error' => 'Unauthorized' })
      end

      it 'rejects request with invalid token' do
        invalid_headers = {
          'Authorization' => 'Bearer invalid_token',
          'Content-Type' => 'application/json'
        }

        post '/api/v1/webhooks/openwa', params: { event: 'message' }, headers: invalid_headers

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with malformed payload' do
      it 'handles error gracefully' do
        allow(WebhookEvent).to receive(:create).and_raise(StandardError.new('Test error'))
        allow(Rails.logger).to receive(:error)

        payload = { event: 'message', data: { from: '5931234567' } }
        post '/api/v1/webhooks/openwa', params: payload, headers: headers

        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
