class ContactsController < ApplicationController
  def index
    #Display records only if logged in
    if logged_in?
      @contacts = current_user.contacts
    else
      @contacts = Contact.none
    end
  end

  def new
    @contact = Contact.new
  end
end
