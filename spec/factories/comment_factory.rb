FactoryGirl.define do 
  sequence(:body) {|n| "test comment #|n|"}

  factory :comment do
    body "testbodycomment"
    user "testusercomment"
    product "testproductcomment"
    rating "5"
  end

end