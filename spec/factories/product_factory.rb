FactoryGirl.define do 
  sequence(:description) {|n| "test dessert #|n|"}

  factory :product do
    name "testproduct1"
    description "yummy"
    image_url "http://placekitten.com/g/200/300"
    colour "red"
    price "200"
  end

end