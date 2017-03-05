require 'rails_helper'

describe Comment, :type => :model do

  context "validate comments" do   
    
    it "tests for all validations" do
      @comment = FactoryGirl.build(:comment, body: "all valid", user: User.new, product: Product.new, rating: 5)
      # binding.pry
      expect(@comment).to be_valid
    end

    it "tests for body" do
      @comment = FactoryGirl.build(:comment, body: nil, user: User.new, product: Product.new, rating: 5)
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "tests for user" do
      @comment = FactoryGirl.build(:comment, body: "product missing", user: nil, product: Product.new, rating: 5)
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "tests for product" do
      @comment = FactoryGirl.build(:comment, body: "product missing", user: User.new, product: nil, rating: 5)
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "tests for rating intger" do
      @comment = FactoryGirl.build(:comment, user: User.new, product: Product.new, rating: "five")
      # binding.pry
      expect(@comment).to_not be_valid
    end

    it "is missing all validations" do
      @comment = FactoryGirl.build(:comment, user: nil, product: nil, rating: "five")
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
