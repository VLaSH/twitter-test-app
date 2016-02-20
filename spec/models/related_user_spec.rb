require 'rails_helper'

RSpec.describe RelatedUser, type: :model do
  describe 'associations' do
    context 'belongs_to user' do
      it { should belong_to(:user) }
    end
    context 'belongs_to follower' do
      it { should belong_to(:related) }
    end
  end
end
