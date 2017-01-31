class RegisteredUsersController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserMailer.hello(@user).deliver
    end
  end

end

# vi http://stackoverflow.com/questions/17479864/rails-devise-send-user-email-after-sign-up-create