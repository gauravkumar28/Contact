class ContactsController < ApplicationController
  
  def index
      @contacts = Contact.search(params[:search])
  end

  def show
    @contact = Contact.find_by_id(params[:id])
  end

  def new
    @contact = Contact.new
    @contact.emails.new
  end

  def create
    email = params[:contact][:email]
    @contact = Contact.find_by_phone(params[:contact][:phone]) || Contact.new(params[:contact].reject{|k|  k=="email"})
    @contact.emails.new(email)
    if @contact.save!
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(feature_params)
      redirect_to contact_path(@contact)
    else
      render 'edit'
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def feature_params
    params.require(:contact).permit(:id, :name, :phone, emails_attributes: [:id, :email_url, :_destroy])
  end
end