FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@email.com"
  end

  factory :user do
    first_name 'Test'
    last_name 'User'
    email
    password '12345678'
  end
end
