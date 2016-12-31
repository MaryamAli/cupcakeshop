class StaticPagesController < ApplicationController
  def index
    redirect_to static_pages_landing_page_path
  end
  
  def landing_page
    # @featured_product = Product.first
    # @products = Product.limit(3)
    @products = Product.limit(5)
  end
end
