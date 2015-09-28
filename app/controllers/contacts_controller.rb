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

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user

    if @contact.save
      flash[:notice] = "Post was successfully submitted."
      redirect_to contacts_path
    else
      render :index
    end
  end

  def contact_params
    params.require(:contact).permit(:contact_name)
  end
end
