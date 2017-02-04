FactoryGirl.define do
  
  factory :user do # NO FACTORIES OUTSIDE OF THIS BLOCK 
    email "users@testcom"
    password "suchtest"
    first_name "User1"
    last_name "Test1"
    admin false
  end  # NO FACTORIES OUTSIDE OF THIS BLOCK ^

end