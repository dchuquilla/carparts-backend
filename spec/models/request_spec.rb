require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should validate_presence_of(:user_phone) }
  it { should validate_presence_of(:part_name) }
  it { should validate_presence_of(:part_brand) }
  it { should validate_presence_of(:part_model) }
  it { should validate_presence_of(:part_year) }
  it { should validate_numericality_of(:part_year).only_integer.is_greater_than(1900).is_less_than(2100) }
end
