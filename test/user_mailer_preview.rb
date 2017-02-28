# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("john@example.com", "John", "Hello World!")
  end

  def paid_success
    UserMailer.paid_success("John", "Doughnut")
  end
 
end