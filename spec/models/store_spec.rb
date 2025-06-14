require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:user) { create(:user) }

  describe 'user association' do
    it 'is invalid without a user' do
      expect(build(:store, user: nil)).not_to be_valid
    end

    it 'belongs to the correct user' do
      store = create(:store, user: user)
      expect(store.user).to eq(user)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:contact_email) }
    it { should validate_presence_of(:contact_phone) }
    it { should validate_presence_of(:address) }
  end

  describe 'factory' do
    it 'is valid with valid attributes' do
      expect(build(:store, user: user)).to be_valid
    end

    it 'is invalid without a name' do
      expect(build(:store, user: user, name: nil)).not_to be_valid
    end

    it 'is invalid without a description' do
      expect(build(:store, user: user, description: nil)).not_to be_valid
    end

    it 'is invalid without a contact email' do
      expect(build(:store, user: user, contact_email: nil)).not_to be_valid
    end

    it 'is invalid without a contact phone' do
      expect(build(:store, user: user, contact_phone: nil)).not_to be_valid
    end

    it 'is invalid without an address' do
      expect(build(:store, user: user, address: nil)).not_to be_valid
    end
  end
end
