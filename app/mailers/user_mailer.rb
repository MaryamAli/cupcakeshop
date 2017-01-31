class UserMailer < ApplicationMailer
  default from: "mali62541@gmail.com"

  def contact_form(email, name, message)
    @message = params[:message]
    @email = params[:email]
    @name = params[:name]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
