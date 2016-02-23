require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject { response }
  let(:correct_params) { attributes_for(:user) }
  let(:incorrect_params) { attributes_for(:user, email: nil) }

  describe '#create' do
    context 'correct params' do
      it do
        allow(UserMailer).to receive(:deliver_mail).and_return('Confirmed')
        post :create, user: correct_params
        expect(subject).to redirect_to(new_session_path)
      end
    end
    context 'incorrect params' do
      it do
        post :create, user: incorrect_params
        expect(subject).to render_template(:new)
      end
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    before { session[:user_id] = user.id }
    
    it do
      put :update, id: user.id, user: correct_params
      expect(subject).to redirect_to(landings_path)
    end
  end

  describe '#destroy' do
    let(:user) { create(:user) }

    it do
      delete :destroy, id: user.id
      expect(subject).to redirect_to(new_user_path)
    end
  end
end
