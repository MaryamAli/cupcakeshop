require 'rails_helper'

describe Comment, :type => :model do
  include ActiveJob::TestHelper

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
  end

  before do
    @comment = FactoryGirl.build(:comment, user: User.new, product: Product.new)
  end

  after do
    clear_enqueued_jobs
  end

  it "tests for after_create_commit" do
    @comment.save!
    expect(enqueued_jobs.size).to eq(1)
  end
  
end

