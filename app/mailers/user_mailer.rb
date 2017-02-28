class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'mali62541@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def hello(user)
    @appname ="Cupcake Shop"
    mail( :to => user.email,
      :subject => "Welcome to #{@appname}!")
  end

  def paid_success(user, product)
    @user = user
    @product = product
    @appname = "Cupcake Shop"
    mail( :to => user.email,
      :subject => "Thank you for your order with #{@appname}.")
  end

end
