require 'rails_helper'

describe Chatbot::OpenwaService do
  let(:service) { described_class.new }
  let(:phone) { "593987654321" }
  let(:message) { "Test message" }
  let(:vcard) { "BEGIN:VCARD\nVERSION:3.0\nFN:Test\nEND:VCARD" }

  describe '.send_message' do
    it 'sends a message via OpenWa API' do
      allow_any_instance_of(described_class).to receive(:post_request).and_return({ success: true })
      result = described_class.send_message(phone, message)
      expect(result).to eq({ success: true })
    end
  end

  describe '.send_contact' do
    it 'sends a contact via OpenWa API' do
      allow_any_instance_of(described_class).to receive(:post_request).and_return({ success: true })
      result = described_class.send_contact(phone, vcard)
      expect(result).to eq({ success: true })
    end
  end

  describe '#send_message' do
    it 'returns empty hash in test environment' do
      expect(Rails.env).to eq('test')
      result = service.send_message(phone, message)
      expect(result).to be_nil
    end

    context 'in non-test environment' do
      before do
        allow(Rails).to receive(:env).and_return('development')
      end

      it 'builds correct payload' do
        expect(service).to receive(:post_request).with(
          '/api/messages/send',
          { to: '593987654321', message: message }
        )
        service.send_message(phone, message)
      end

      it 'normalizes phone numbers' do
        expect(service).to receive(:post_request).with(
          '/api/messages/send',
          { to: '593987654321', message: message }
        )
        service.send_message('+593-987-654-321', message)
      end
    end
  end

  describe '#send_contact' do
    it 'returns empty hash in test environment' do
      expect(Rails.env).to eq('test')
      result = service.send_contact(phone, vcard)
      expect(result).to be_nil
    end

    context 'in non-test environment' do
      before do
        allow(Rails).to receive(:env).and_return('development')
      end

      it 'builds correct payload' do
        expect(service).to receive(:post_request).with(
          '/api/contacts/send',
          { to: '593987654321', vcard: vcard }
        )
        service.send_contact(phone, vcard)
      end
    end
  end

  describe '#get_account_info' do
    it 'returns empty hash in test environment' do
      expect(Rails.env).to eq('test')
      result = service.get_account_info
      expect(result).to be_nil
    end

    context 'in non-test environment' do
      before do
        allow(Rails).to receive(:env).and_return('development')
      end

      it 'calls get_request with /api/me path' do
        expect(service).to receive(:get_request).with('/api/me')
        service.get_account_info
      end
    end
  end

  describe '#normalize_phone' do
    it 'removes non-digit characters' do
      result = service.send(:normalize_phone, '+593-987-654-321')
      expect(result).to eq('593987654321')
    end

    it 'preserves leading plus sign' do
      result = service.send(:normalize_phone, '+593987654321')
      expect(result).to eq('593987654321')
    end

    it 'handles phone as integer' do
      result = service.send(:normalize_phone, 593987654321)
      expect(result).to eq('593987654321')
    end
  end

  describe '#handle_response' do
    let(:http_response) { instance_double('Net::HTTPResponse') }

    context 'successful response' do
      before { allow(http_response).to receive(:code).and_return('200') }

      it 'parses JSON response' do
        allow(http_response).to receive(:body).and_return('{"success":true}')
        result = service.send(:handle_response, http_response, '/test')
        expect(result).to eq({ "success" => true })
      end
    end

    context 'authentication error' do
      before do
        allow(http_response).to receive(:code).and_return('401')
        allow(Rails.logger).to receive(:error)
      end

      it 'logs authentication error' do
        expect(Rails.logger).to receive(:error).with(/authentication failed/i)
        service.send(:handle_response, http_response, '/test')
      end

      it 'returns error hash' do
        result = service.send(:handle_response, http_response, '/test')
        expect(result).to eq({ error: 'Authentication failed' })
      end
    end

    context 'rate limit error' do
      before do
        allow(http_response).to receive(:code).and_return('429')
        allow(Rails.logger).to receive(:warn)
      end

      it 'logs rate limit warning' do
        expect(Rails.logger).to receive(:warn).with(/rate limited/i)
        service.send(:handle_response, http_response, '/test')
      end
    end

    context 'invalid JSON response' do
      before do
        allow(http_response).to receive(:code).and_return('200')
        allow(http_response).to receive(:body).and_return('invalid json')
        allow(Rails.logger).to receive(:error)
      end

      it 'handles JSON parse error' do
        result = service.send(:handle_response, http_response, '/test')
        expect(result).to eq({ error: 'Invalid response format' })
      end
    end
  end
end
