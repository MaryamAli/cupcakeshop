class PaymentsController < ApplicationController
  def create
    # create charge on Stripe servers(will charge user's card)
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    


    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price * 100), #amt in cents into dollars
        :currency => "usd",
        :source => token,
        :description => params[:StripeEmail]
        )
    rescue Stripe::CardError => e #card is declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error in processing your payment: #{err[:message]}"
    end 
    redirect_to = product_path(@product)
end
