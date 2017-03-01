require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(name: "race bike", description: "two wheels", image_url:"bike.jpg", colour: "blue", price: "5")
      @user = User.create!(email: "such@test.com", password: "muchwow")
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike")
      @product.comments.create!(rating: 5, user: @user, body: "I won awards with this")
      @product.comments.create!(rating: 3, user: @user, body: "Good starter bike")
    end
    
    # For average_rating method
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    # Validation test
    it "is not valid" do
      expect(Product.new(description: "Nice Bike")).not_to be_valid
    end
  end
end 
