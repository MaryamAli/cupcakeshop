require 'rails_helper'

describe Comment, :type => :model do

  context "validate comments" do   
    
    it "tests for presence of all validations" do
      @comment = FactoryGirl.build(:comment, user: User.new, product: Product.new)
      # binding.pry
      expect(@comment).to be_valid
    end

    it "tests for missing body" do
      @comment = FactoryGirl.build(:comment, body: nil, user: User.new, product: Product.new)
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "tests for missing user" do
      @comment = FactoryGirl.build(:comment, user: nil, product: Product.new)
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "tests for missing product" do
      @comment = FactoryGirl.build(:comment, user: User.new, product: nil)
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "tests for rating as an integer" do
      @comment = FactoryGirl.build(:comment, user: User.new, product: Product.new, rating: "five")
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "tests for missing rating" do
      @comment = FactoryGirl.build(:comment, user: User.new, product: Product.new, rating: nil)
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "is missing all validations" do
      @comment = FactoryGirl.build(:comment, body: nil, user: nil, product: nil, rating: nil)
      # binding.pry
      expect(@comment).to_not be_valid
    end
  

    # it "tests for after_create_comment"
    # end

    # it "tests for scope"
    # end

    # it "doesn't stop working in the future"
    # end
  end
end
