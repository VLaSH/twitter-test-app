FactoryGirl.define do
  sequence :uid do |n|
    "qwertyuiop#{n}"
  end

  factory :social_account, class: 'User::SocialAccount' do
    association :user
    provider 'facebook'
    uid
  end
end
