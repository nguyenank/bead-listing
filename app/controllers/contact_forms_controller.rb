# https://everydayrails.com/2011/09/07/rails-contact-form.html

class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request
      if !@contact_form.deliver
        render 'new'
      end
    rescue ScriptError
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end

end
