require 'rails_helper'

RSpec.describe InteractedTweet, type: :model do
  describe 'associations' do
    context 'belongs_to user' do
      it { should belong_to(:user) }
    end
    context 'belongs_to tweet' do
      it { should belong_to(:tweet) }
    end
  end
end
