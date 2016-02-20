FactoryGirl.define do
  factory :comment do
    association :tweet
    association :user
    body 'comment body'
  end
end
