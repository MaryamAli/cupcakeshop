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

      if charge.paid
        Order.create!( #create! returns an error msg, if any
          product_id: @product.id,
          user_id: @user_id,
          total: @product.price
          )
        UserMailer.paid_success(@user, @product).deliver_now
        # flash[:success] = "Payment has been received."
      end

    rescue Stripe::CardError => e #card is declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error in processing your payment: #{err[:message]}"
    end 
    redirect_to product_path(@product)
  end
end
