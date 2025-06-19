require 'rails_helper'

RSpec.describe Proposal, type: :model do
  let(:proposal) { build(:proposal) }

  describe 'associations' do
    it { should belong_to(:request) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_presence_of(:currency) }
    it { should validate_numericality_of(:delivery_time_days).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { should validate_numericality_of(:warranty_months).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { should validate_length_of(:notes).is_at_most(500).allow_blank }
    it { should validate_inclusion_of(:status).in_array(%w[pending accepted rejected]).allow_blank }
  end

  describe 'factory' do
    it 'is valid with valid attributes' do
      expect(proposal).to be_valid
    end
  end
end
