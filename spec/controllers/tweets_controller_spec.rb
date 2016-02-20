require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  subject { response }
  let(:correct_params) { attributes_for(:tweet) }
  let(:incorrect_params) { attributes_for(:tweet, body: '') }
  let!(:user) { create(:user) }
  before(:each) { session[:user_id] = user.id }

  describe '#create' do
    before { request.env["HTTP_REFERER"] = landings_path }

    context 'correct params' do
      it do
        post :create, tweet: correct_params, format: :js
        expect(subject).to render_template(:create)
      end
    end
    context 'incorrect_params' do
      it do
        post :create, tweet: incorrect_params, format: :js
        is_expected.to have_http_status :unprocessable_entity
      end
    end
  end

  describe '#update' do
    let(:tweet) { create(:tweet, user: user) }

    context 'correct_params' do
      it do
        patch :update, id: tweet.id, tweet: correct_params, format: :js
        expect(subject).to render_template(:update)
      end
    end
    context 'incorrect_params' do
      it do
        patch :update, id: tweet.id, tweet: incorrect_params, format: :js
        is_expected.to have_http_status :unprocessable_entity
      end
    end
  end

  describe '#destroy' do
    let(:tweet) { create(:tweet) }
    
    it 'render_template' do
      delete :destroy, id: tweet.id, format: :js
      expect(:subject).to render_template(:destroy)
    end
  end
end
