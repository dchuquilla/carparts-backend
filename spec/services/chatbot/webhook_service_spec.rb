require 'rails_helper'

describe Chatbot::WebhookService do
  let(:request) { create(:request, user_phone: '593987654321', part_name: 'Spark Plugs') }
  let(:proposal) { create(:proposal, request: request) }
  let(:store) { create(:store, phone: '593912345678') }
  let(:service) do
    described_class.new(
      request: request,
      proposal: proposal,
      store: store,
      url: '/requests/123',
      message: 'Error message'
    )
  end

  before do
    allow(Rails.application.credentials).to receive(:dig).with(:web_url).and_return('https://example.com')
    allow(Chatbot::OpenwaService).to receive(:send_message).and_return(true)
    allow(Chatbot::OpenwaService).to receive(:send_contact).and_return(true)
  end

  describe '#notify_request_success' do
    it 'sends success message to user' do
      expect(Chatbot::OpenwaService).to receive(:send_message).with(
        request.user_phone,
        an_instance_of(String)
      )

      service.notify_request_success
    end

    it 'does nothing in test environment' do
      expect(Chatbot::OpenwaService).not_to receive(:send_message)
      service.notify_request_success
    end
  end

  describe '#notify_request_image' do
    it 'sends image request message to user' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message).with(
        request.user_phone,
        an_instance_of(String)
      )

      service.notify_request_image
    end
  end

  describe '#notify_request_chassis' do
    it 'sends chassis request message to user' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message).with(
        request.user_phone,
        an_instance_of(String)
      )

      service.notify_request_chassis
    end
  end

  describe '#notify_request_updated' do
    it 'sends update confirmation message' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message)

      service.notify_request_updated
    end
  end

  describe '#notify_request_duplicated' do
    it 'sends duplicate warning message' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message)

      service.notify_request_duplicated
    end
  end

  describe '#notify_new_store' do
    it 'sends confirmation message to store' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message).with(
        store.phone,
        an_instance_of(String)
      )

      service.notify_new_store
    end
  end

  describe '#notify_proposal_created' do
    it 'sends proposal notification to user' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message)

      service.notify_proposal_created
    end
  end

  describe '#notify_request_store' do
    it 'sends request to all paid subscribers' do
      allow(Rails).to receive(:env).and_return('development')

      store1 = create(:store, phone: '5939111111')
      store2 = create(:store, phone: '5939222222')
      user1 = store1.user
      user2 = store2.user
      user1.update(subscription_tier: :paid)
      user2.update(subscription_tier: :paid)

      expect(Chatbot::OpenwaService).to receive(:send_message).at_least(2).times

      service.notify_request_store
    end

    it 'uses async for concurrent sends' do
      allow(Rails).to receive(:env).and_return('development')
      allow(User).to receive(:paid_subscribers).and_return(User.none)

      expect(Async).to receive(:do)

      service.notify_request_store
    end
  end

  describe '#notify_requests_list_store' do
    it 'sends list reminder to all paid subscribers' do
      allow(Rails).to receive(:env).and_return('development')

      store1 = create(:store, phone: '5939111111')
      user1 = store1.user
      user1.update(subscription_tier: :paid)

      expect(Chatbot::OpenwaService).to receive(:send_message).at_least(1).times

      service.notify_requests_list_store
    end
  end

  describe '#notify_proposal_accepted' do
    it 'sends acceptance message to store' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message)

      service.notify_proposal_accepted
    end
  end

  describe '#notify_contact_to_user' do
    it 'sends store contact to customer' do
      allow(Rails).to receive(:env).and_return('development')
      vcard = proposal.user.create_contact

      expect(Chatbot::OpenwaService).to receive(:send_contact).with(
        proposal.request.user_phone,
        vcard
      )

      service.notify_contact_to_user
    end
  end

  describe '#notify_contact_to_store' do
    it 'sends customer contact to store' do
      allow(Rails).to receive(:env).and_return('development')
      vcard = proposal.request.create_contact

      expect(Chatbot::OpenwaService).to receive(:send_contact).with(
        proposal.user.phone,
        vcard
      )

      service.notify_contact_to_store
    end
  end

  describe '#notify_request_failed' do
    it 'sends error message with details' do
      allow(Rails).to receive(:env).and_return('development')
      expect(Chatbot::OpenwaService).to receive(:send_message)

      service.notify_request_failed
    end
  end

  describe 'message localization' do
    it 'includes web_url in notification messages' do
      allow(Rails).to receive(:env).and_return('development')

      expect(Chatbot::OpenwaService).to receive(:send_message).with(
        request.user_phone,
        match(/https:\/\/example\.com/)
      )

      service.notify_request_success
    end
  end
end
