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
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end
end
