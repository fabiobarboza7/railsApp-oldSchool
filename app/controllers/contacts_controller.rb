class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def new
    @contact = Contact.new
  end

  def show
    # before_action
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to root_path
  end

  def update
    # before_action
    @contact.update(contact_params)
    redirect_to root_path
  end

  def destroy
    # before_action
    @contact.destroy
    redirect_to root_path
  end


  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
