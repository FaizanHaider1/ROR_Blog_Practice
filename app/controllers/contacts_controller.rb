class ContactsController < ApplicationController
  
    def new
      @contact = Contact.new
    end
  
    def create
      @contact = Contact.new
  
      if @contact.save
        render html: "<script>alert('Message sent successfully')</script>".html_safe
        @contact = Contact.new
        # redirect_to(new_contact_path(@contact))
      else
        render :new
      end
    end
end