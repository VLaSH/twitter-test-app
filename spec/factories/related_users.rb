FactoryGirl.define do
  factory :related_user do
    association :user
    association :related
    type 'RelatedUser::Follower'
  end

  factory :follower, parent: :related_user do
  end

  factory :favourite_user, parent: :related_user do
  end
end
