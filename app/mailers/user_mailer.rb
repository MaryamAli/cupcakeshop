class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
      mail(:from => email,
        :to => 'mali62541@gmail.com',
        :subject => "A new contact from message from #{name}") 
  end
end
