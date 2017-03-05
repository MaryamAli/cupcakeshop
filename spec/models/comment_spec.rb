require 'rails_helper'

describe Comment, :type => :model do

  before do
    @comment = FactoryGirl.build(:comment, user: User.new, product: Product.new)
  end
  
  context "validate comments" do   
    
    it "tests for presence of all validations" do
      # binding.pry
      expect(@comment).to be_valid
    end

    it "tests for missing body" do
      @comment.body = nil
      expect(@comment).to_not be_valid
    end

    it "tests for missing user" do
      @comment.user = nil
      expect(@comment).to_not be_valid
    end

    it "tests for missing product" do
      @comment.product = nil
      expect(@comment).to_not be_valid
    end

    it "tests for rating as an integer" do
      @comment.rating = "five"
      expect(@comment).to_not be_valid
    end

    it "tests for missing rating" do
      @comment.rating = nil
      expect(@comment).to_not be_valid
    end

    it "is missing all validations" do
      @comment = FactoryGirl.build(:comment, body: nil, user: nil, product: nil, rating: nil)
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
