class ContactsController < ApplicationController
  before_action :require_user

  def index
    @contacts = current_user.contacts
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
      flash[:success] = "Contact created."
      redirect_to contacts_path
    else
      render :new
    end
  end

  def contact_params
    params.require(:contact).permit(:contact_name, :phone, :email)
  end
end
