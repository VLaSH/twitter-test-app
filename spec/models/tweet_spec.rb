require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'asociations' do
    context 'belongs_to user' do
      it { should belong_to(:user) }
    end
    context 'has_many comments' do
      it { should have_many(:comments) }
    end
  end

  describe 'validations' do
    context 'body presence' do
      it { should validate_presence_of(:body) }
    end
    context 'body length' do
      it { should validate_length_of(:body).is_at_most(100) }
    end
  end
end
