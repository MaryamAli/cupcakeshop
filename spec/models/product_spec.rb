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
  end

  context "when a new product is created" do
    # Validation tests
    it "is valid" do 
      expect(Product.new(name: "exists", description: "exists", image_url: "exists", colour: "exists", price: "1")).to be_valid
    end

    it "is missing name" do
      expect(Product.new(name: nil, description: "exists", image_url: "exists", colour: "exists", price: "1")).not_to be_valid
    end

    it "is missing description" do
      expect(Product.new(name: "exists", description: nil, image_url: "exists", colour: "exists", price: "1")).not_to be_valid
    end

    it "is missing image" do
      expect(Product.new(name: "exists", description: "exists", image_url: nil, colour: "exists", price: "1")).not_to be_valid
    end

    it "is missing colour" do
      expect(Product.new(name: "exists", description: "exists", image_url: "exists", colour: nil, price: "1")).not_to be_valid
    end

    it "price is not greater than zero" do
      expect(Product.new(name: "exists", description: "exists", image_url: "exists", colour: "exists", price: "0")).not_to be_valid
    end

    it "price is not an integer" do
      expect(Product.new(name: "exists", description: "exists", image_url: "exists", colour: "exists", price: "zero")).not_to be_valid
    end

    it "price is missing" do
      expect(Product.new(name: "exists", description: "exists", image_url: "exists", colour: "exists", price: nil)).not_to be_valid
    end

    it "is missing all validations" do
      expect(Product.new(name: nil, description: nil, image_url: nil, colour: nil, price: nil)).not_to be_valid
    end
  end
end 
