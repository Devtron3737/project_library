class ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def show
    # debugger
    id = params[:id]
    render json: Contact.find(id)
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact = Contact.find(params.require(:contact).permit(:id))
    if contact.update(contact_params)
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
    # .permit(:name, :email))
  end

  def destroy
    contact = Contact.find(params[:contact][:id])

    if contact.delete
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
