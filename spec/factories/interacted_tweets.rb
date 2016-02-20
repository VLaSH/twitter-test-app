FactoryGirl.define do
  factory :interacted_tweet do
    association :tweet
    association :user
  end

  factory :favourite_tweet, parent: :interacted_tweet do
  end

  factory :liked_tweet, parent: :interacted_tweet do
  end
end
