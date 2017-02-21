# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
    #default method provided by ActionCable to stop all previous streams
    stop_all_streams
    #will stream from channel specific to one of the products
    stream_for data["product_id"]


  end

end
