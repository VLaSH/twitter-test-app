require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  subject { response }

  describe '#create' do
    context 'user exists' do
      let(:user) { create(:user) }

      it do
        post :create, email: user.email, password: user.password
        expect(subject).to redirect_to(landings_path)
      end
    end
    context 'user does not exist' do
      it do
        post :create
        expect(subject).to render_template(:new)
      end
    end
    context 'wrong password' do
      let(:user) { create(:user) }

      it do
        post :create, email: user.email, password: 'wrong_password'
        expect(subject).to render_template(:new)
      end
    end
  end

  describe '#destroy' do
    it do
      delete :destroy, id: 'destroy_session'
      expect(subject).to redirect_to(new_session_path)
    end
  end
end
