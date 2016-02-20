require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    context 'has_many followers' do
      it { should have_many(:followers).class_name('RelatedUser::Follower') }
    end
    context 'has_many favourite_users' do
      it { should have_many(:favourite_users).class_name('RelatedUser::Favourite') }
    end
    context 'has_many tweets' do
      it { should have_many(:tweets) }
    end
    context 'has_many favourite_tweets' do
      it { should have_many(:favourite_tweets).class_name('InteractedTweet::Favourite') }
    end
    context 'has_many liked_tweets' do
      it { should have_many(:liked_tweets).class_name('InteractedTweet::Liked') }
    end
    context 'has_many social_accounts' do
      it { should have_many(:social_accounts) }
    end
    context 'has_many comments' do
      it { should have_many(:comments) }
    end
  end

  describe 'methods' do
    context '#followers_and_user' do
      let!(:user) { create(:user) }

      it { expect(user.followers_and_user.count).to eq(1) }
    end
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
    context 'password length'do
      it { should validate_length_of(:password).is_at_least(8).is_at_most(16) }
    end
  end
end
