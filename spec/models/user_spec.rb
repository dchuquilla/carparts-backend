require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      email: "test@example.com",
      password: "password",
      phone: "1234567890",
      store_name: "Test Store"
    )
  }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a phone" do
      subject.phone = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a store_name" do
      subject.store_name = nil
      expect(subject).to_not be_valid
    end
  end
end
