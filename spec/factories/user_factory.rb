FactoryGirl.define do
  factory :user do
    name "SimpleUser"
    email "user@example.com"
    password "iamauser"
    password_confirmation "iamauser"
  end
end