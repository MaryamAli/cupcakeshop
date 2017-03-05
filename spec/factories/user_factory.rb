FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do # NO FACTORIES OUTSIDE OF THIS BLOCK 
    email 
    password "suchtest"
    first_name "User1"
    last_name "Test1"
    admin false
  end  

  factory :admin, class: User do
    email
    password "cashmeousside"
    admin true
    first_name "AdminUser"
    last_name "UserAdminLastName"
  end

end