require 'spec_helper'

describe PagesController do
  describe 'GET front' do
    it 'renders the front template if not logged in' do
      get :front
      expect(response).to render_template(:front)
    end

    it 'redirects to the home_path if logged in' do
      session[:user_id] = Fabricate(:user).id
      get :front
      expect(response).to redirect_to(home_path)
    end
  end
end
