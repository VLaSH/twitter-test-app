require 'rails_helper'

RSpec.describe Users::SocialAccountsController, type: :controller do
  subject { response }
  let!(:user) { create(:user) }
  let(:attrs) { attributes_for(:social_account) }
  let(:params) { attributes_for(:user, social_accounts_attributes: attrs) }
  before { session[:user_id] = user.id }

  describe '#create' do
    context 'correct_params' do
      it do
        request.env['omniauth.auth'] = params
        post :create
        expect(subject).to redirect_to(landings_path)
      end
    end
    context 'incorrect_params' do
      it do
        params[:email] = ''
        request.env['omniauth.auth'] = params
        post :create
        expect(subject).to redirect_to(new_session_path)
      end
    end
  end
end
