require 'rails_helper'

RSpec.describe InteractedTweetsController, type: :controller do
  subject { response }
  let!(:user) { create(:user) }
  let!(:tweet) { create(:tweet) }
  let!(:favourite_tweet) { create(:favourite_tweet, user: user, tweet: tweet) }
  before(:each) { session[:user_id] = user.id }

  describe '#create' do
    context 'correct_params' do
      it do
        post :create, interact_object: 'InteractedTweet::Favourite',
                      tweet_id: tweet.id,
                      format: :js
        expect(subject).to render_template(:create)
      end
    end
    context 'incorrect_params' do
      it do
        post :create, interact_object: 'Incorrect constant',
                      tweet_id: tweet.id,
                      format: :js
        is_expected.to have_http_status :unprocessable_entity
      end
    end
  end

  describe '#destroy' do
    it do
      delete :destroy, id: 'no_id', interact_object: 'InteractedTweet::Favourite',
                       format: :js
      expect(subject).to render_template(:destroy)
    end
  end
end
