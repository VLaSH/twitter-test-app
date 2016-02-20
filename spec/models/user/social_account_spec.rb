require 'rails_helper'

RSpec.describe User::SocialAccount, type: :model do
  describe 'associations' do
    context 'belongs_to user' do
      it { should belong_to(:user) }
    end
  end

  describe 'validations' do
    context 'uniqueness of uid' do
      let!(:social_account) { create(:social_account) }

      it { should validate_uniqueness_of(:uid) }
    end
  end

  describe 'enumerator' do
    it { should define_enum_for(:provider) }
  end
end
