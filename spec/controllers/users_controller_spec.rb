require 'spec_helper'

describe UsersController do
  describe 'GET new' do
    it 'sets the @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'with valid parameters' do
      before {post :create, user: {username: "one@two.com", password: "correct",
                                   password_confirmation: "correct", name: "Name"}}

      it 'creates a new user' do
        expect(User.first).not_to be_nil
      end

      it 'sets the flash success' do
        expect(flash[:success]).not_to be_blank
      end

      it 'logs in the user' do
        user = User.find(session[:user_id])
        expect(user.name).to eq("Name")
      end

      it 'redirects to the root_path' do
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid parameters' do
      before { post :create, user: { password: "correct", name: "Name" } }

      it 'sets the flash error' do
        expect(flash[:error]).not_to be_blank
      end

      it 'renders the new template' do
        expect(response).to render_template :new
      end
    end

    context 'with incorrect password confirmation' do
      before {post :create, user: {username: "one@two.com", password: "correct",
                                   password_confirmation: "notcorrect", name: "Name"}}

      it 'sets the flash error' do
        expect(flash[:error]).not_to be_blank
      end

      it 'renders the new template' do
        expect(response).to render_template :new
      end
    end
  end
end
