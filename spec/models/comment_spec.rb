require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    context 'belong_to tweet' do
      it { should belong_to(:tweet) }
    end
    context 'belong_to user' do
      it { should belong_to(:user) }
    end
  end
end
