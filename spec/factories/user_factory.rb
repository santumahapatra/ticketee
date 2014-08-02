FactoryGirl.define do
  factory :user do
    name "SimpleUser"
    email "sample@example.com"
    password "iamauser"
    password_confirmation "iamauser"

    factory :admin_user do
      admin true
    end
  end
end