class ContactsController < ApplicationController
    def index
      @contacts = Contact.all
    end

    def new
      @contact = Contact.new
    end
    def show
      @contact = Contact.find(params[:id])
    end
  
    def create
      @contact = Contact.new(contact_params)
  
      if @contact.save
        render html: "<script>alert('Message sent successfully #{contact_params}')</script>".html_safe and return
        redirect_to new_contact_path
      end
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
  
      redirect_to @contact
    end

    private
    def contact_params
      params.require(:contact).permit(:subject, :email, :message )
    end
end