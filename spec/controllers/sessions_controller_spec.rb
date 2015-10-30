require 'spec_helper'

describe SessionsController do
  describe 'GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'with everything good' do
      let!(:user) { Fabricate(:user, username: "username", password: "correct") }
      before { post :create, user: {username: "username", password: "correct" } }

      it 'sets the session[:user_id]' do
        expect(session[:user_id]).to eq(user.id)
      end

      it 'sets the flash succes' do
        expect(flash[:success]).not_to be_blank
      end

      it 'redirects to the root_path' do
        expect(response).to redirect_to root_path
      end
    end

    context 'without user existing' do
      before { post :create, user: {username: "username", password: "correct" } }

      it 'sets the flash danger' do
        expect(flash[:danger]).not_to be_blank
      end

      it 'redirects to the login path' do
        expect(response).to redirect_to login_path
      end
    end

    context 'with a user, but incorrect password' do
      let!(:user) { Fabricate(:user, username: "username", password: "correct") }
      before { post :create, user: {username: "username", password: "notcorrect" } }

      it 'sets the flash danger' do
        expect(flash[:danger]).not_to be_blank
      end

      it 'redirects to the login path' do
        expect(response).to redirect_to login_path
      end
    end
  end

  describe 'POST destroy' do
    it 'clears the session[:user_id]' do
      post :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'sets the flash success message' do
      post :destroy
      expect(flash[:success]).not_to be_blank
    end

    it 'redirects to the root_path' do
      post :destroy
      expect(response).to redirect_to root_path
    end
  end
end
