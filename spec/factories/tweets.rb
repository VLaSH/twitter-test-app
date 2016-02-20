FactoryGirl.define do
  factory :tweet do
    association :user
    body 'tweet body'
  end
end
