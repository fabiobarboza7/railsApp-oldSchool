class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def new
    @contact = Contact.new
    authorize @contact
  end

  def show
    # before_action
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    if @contact.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    # before_action
    @contact.update(contact_params)
    authorize @contact
    redirect_to root_path
  end

  def destroy
    # before_action
    @contact.destroy
    authorize @contact
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
