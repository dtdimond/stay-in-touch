require 'spec_helper'

describe ContactsController do
  describe 'GET index' do
    it 'sets @contacts if logged in' do
      contact1 = Fabricate(:contact)
      contact2 = Fabricate(:contact)
      session[:user_id] = Fabricate(:user, contacts: [contact1, contact2]).id
      get :index
      expect(assigns(:contacts)).to eq([contact1, contact2])
    end

    it 'renders the index template if logged in' do
      session[:user_id] = Fabricate(:user).id
      get :index
      expect(response).to render_template :index
    end

    it_behaves_like 'requires sign in' do
      let(:action) { get :index }
    end
  end

  describe 'GET new' do
    it 'sets @contact to a new contact' do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'renders the new template' do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to render_template :new
    end

    it_behaves_like 'requires sign in' do
      let(:action) { get :new }
    end
  end

  describe 'GET show' do
    it 'sets the @contact to the appropriate contact if logged in' do
      session[:user_id] = Fabricate(:user).id
      contact = Fabricate(:contact)
      get :show, id: contact.id
      expect(assigns(:contact)).to eq(contact)
    end

    it 'renders the show template if logged in' do
      session[:user_id] = Fabricate(:user).id
      get :show, id: 1
      expect(response).to render_template :show
    end

    it_behaves_like 'requires sign in' do
      let(:action) { get :show, id: 1 }
    end

  end

  describe 'POST create' do
    it 'creates a new contact if params valid and logged in' do
      set_current_user
      post :create, contact: {contact_name: "name", phone: "111-111-1111", email: "e@t.com"}
      expect(Contact.first).not_to be_nil
    end

    it 'sets the flash success if params valid and logged in' do
      set_current_user
      post :create, contact: {contact_name: "name", phone: "111-111-1111", email: "e@t.com"}
      expect(flash[:success]).not_to be_blank
    end

    it 'redirects to the contacts_path if logged in' do
      set_current_user
      post :create, contact: {contact_name: "name", phone: "111-111-1111", email: "e@t.com"}
      expect(response).to redirect_to contacts_path
    end

    it 'renders the new template if user logged in, but params invalid' do
      set_current_user
      post :create, contact: {phone: "111-111-1111", email: "e@t.com"}
      expect(response).to render_template :new
    end

    it_behaves_like 'requires sign in' do
      let(:action) { post :create }
    end
  end
end
