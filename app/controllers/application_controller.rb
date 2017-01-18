class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #provide flash error notice and redirected to home page when trying to edit any user other than the logged in one
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
end
end

