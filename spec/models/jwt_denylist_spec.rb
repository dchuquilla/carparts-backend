require 'rails_helper'

RSpec.describe JwtDenylist, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:jti) }
  end


  describe 'database columns' do
    it { should have_db_column(:jti).of_type(:string) }
  end


  describe 'factory' do
    it 'is valid' do
      expect(create(:jwt_denylist)).to be_valid
    end
  end

  describe 'scopes' do
    let!(:denylist_entry) { create(:jwt_denylist) }

    describe '.by_jti' do
      it 'returns the entry with the given jti' do
        expect(JwtDenylist.by_jti(denylist_entry.jti)).to include(denylist_entry)
      end

      it 'does not return entries with different jtis' do
        expect(JwtDenylist.by_jti('different_jti')).not_to include(denylist_entry)
      end
    end
  end


  describe 'class methods' do
    describe '.revoke_jti' do
      let(:denylist_entry) { create(:jwt_denylist) }

      it 'revokes the entry with the given jti' do
        expect(JwtDenylist).to receive(:by_jti).with(denylist_entry.jti).and_return(denylist_entry)
        expect(denylist_entry).to receive(:revoke)
        JwtDenylist.revoke_jti(denylist_entry.jti)
      end
    end
  end

  describe 'database indexes' do
    it { should have_db_index(:jti).unique(true) }
  end

  describe 'database constraints' do
    it 'validates that jti is unique' do
      create(:jwt_denylist, jti: 'unique_jti')
      expect {
        create(:jwt_denylist, jti: 'unique_jti')
      }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Jti has already been taken/)
    end
  end

  describe 'serialization' do
    it 'serializes and deserializes the jti correctly' do
      denylist_entry = create(:jwt_denylist)
      serialized_jti = denylist_entry.jti.to_json
      expect(serialized_jti).to eq(denylist_entry.jti.to_json)
      expect(JSON.parse(serialized_jti)).to eq(denylist_entry.jti)
    end
  end

  describe 'deserialization' do
    it 'deserializes the jti correctly' do
      denylist_entry = create(:jwt_denylist)
      serialized_jti = denylist_entry.jti.to_json
      expect(JSON.parse(serialized_jti)).to eq(denylist_entry.jti)
    end
  end
end
