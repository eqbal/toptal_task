FactoryGirl.define do
  factory :admin do
    username "admin"
    email "admin@example.com"
    admin true
    locked false
    slug "user-admin"        
  end
end
