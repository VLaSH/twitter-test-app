require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    context 'has_many following_users' do
      it { should have_many(:following_users).class_name('User') }
    end
    context 'has_many favourite_users' do
      it { should have_many(:favourite_users).class_name('User') }
    end
    context 'has_many tweets' do
      it { should have_many(:tweets) }
    end
    context 'has_many favourite_tweets' do
      it { should have_many(:favourite_tweets).class_name('Tweet') }
    end
    context 'has_many liked_tweets' do
      it { should have_many(:liked_tweets).class_name('Tweet') }
    end
    context 'has_many social_accounts' do
      it { should have_many(:social_accounts) }
    end
    context 'has_many comments' do
      it { should have_many(:comments) }
    end
  end

  describe 'methods' do
    context '.from_omniauth' do
      let(:social_accounts_attributes) { attributes_for(:social_account) }
      let(:auth_params) { attributes_for(:user, social_accounts_attributes: social_accounts_attributes) }

      it { expect(User.from_omniauth(auth_params)).to be_a_new(User) }
    end
  end

  describe 'validations' do
    context 'first_name presence'do
      it { should validate_presence_of(:first_name) }
    end
    context 'first_name length'do
      it { should validate_length_of(:first_name).is_at_most(35) }
    end
    context 'last_name presence'do
      it { should validate_presence_of(:last_name) }
    end
    context 'last_name length'do
      it { should validate_length_of(:last_name).is_at_most(35) }
    end
    context 'email presence'do
      it { should validate_presence_of(:email) }
    end
    context 'email length'do
      it { should validate_length_of(:email).is_at_most(55) }
    end
    context 'email uniqueness'do
      let!(:user) { create(:user) }

      it { should validate_uniqueness_of(:email) }
    end
    context 'password presence'do
      it { should validate_presence_of(:password) }
    end
  end
end
