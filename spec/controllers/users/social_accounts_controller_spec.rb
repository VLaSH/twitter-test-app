require 'rails_helper'

RSpec.describe Users::SocialAccountsController, type: :controller do
  subject { response }
  let!(:user) { create(:user) }
  let(:attrs) { attributes_for(:social_account) }
  before { session[:user_id] = user.id }

  describe '#create' do
    params = { 'info': {
      'name': 'One Two', 'email': 'email@email', 'image': 'image' }.stringify_keys!,
      'provider': 'facebook', 'uid': '123123123'
    }.stringify_keys!
    
    it do
      request.env['omniauth.auth'] = params
      post :create
      expect(subject).to redirect_to(landings_path)
    end
  end
end
