class ContactsController < ApplicationController
  before_filter :set_contact, only: [:show, :update, :destroy]


  def index
    # contacts = Contact.where(:user_id => params[:user_id])
#     @contacts.concat(ContactShare.where(:user_id => params[:user_id]))
    user = User.find(params[:user_id])
    render :json => user.all_contacts
  end

  def show
    render :json => @contact
  end


  def create
    contact = Contact.new(contact_params)
    contact.user_id = params[:user_id]

    if contact.save
      render :json => contact
    else
      render :json => contact.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def update
    if @contact.update_attributes(contact_params)
      render :json => @contact
    else
      render :json => @contact.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def destroy
    contact = @contact.dup
    @contact.destroy
    render :json => contact
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end


  def contact_params
    params.require(:contact).permit(:user_id, :name, :email, :favorite)
  end


end
