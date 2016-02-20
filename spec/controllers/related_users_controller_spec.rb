require 'rails_helper'

RSpec.describe RelatedUsersController, type: :controller do
  subject { response }
  let!(:users) { create_list(:user, 2) }
  let!(:follower) { create(:follower, user: users.first, related: users.last) }
  before(:each) { session[:user_id] = users.first.id }

  describe '#create' do
    context 'correct_params' do
      it do
        post :create, related_user: 'RelatedUser::Follower',
                      related_id: users.last.id,
                      format: :js
        expect(subject).to render_template(:create)
      end
    end
    context 'incorrect_params' do
      it do
        post :create, related_user: 'Incorrect constant',
                      related_id: users.last.id,
                      format: :js
        is_expected.to have_http_status :unprocessable_entity
      end
    end
  end

  describe '#destroy' do
    it do
      delete :destroy, id: 'no_id', related_user: 'RelatedUser::Follower',
                       format: :js
      expect(subject).to render_template(:destroy)
    end
  end
end
