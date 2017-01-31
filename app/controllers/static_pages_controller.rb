class StaticPagesController < ApplicationController
  def index
    redirect_to static_pages_landing_page_path
  end
  
  def landing_page
    # @featured_product = Product.first
    # @products = Product.limit(3)
    @products = Product.limit(5)
  end

  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  ActionMailer::Base.mail(:from => @email,
      :to => 'mali62541@gmail.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
end

end
