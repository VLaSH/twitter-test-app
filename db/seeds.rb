# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..5).each do |number|
  user = User.create({
    first_name: "#{number}Test",
    last_name: 'User',
    email: "#{number}test@user.com",
    password: '12345678'
  })
  tweet = Tweet.create({
    user: user,
    body: "#{number}test tweet body"
  })
  tweet2 = Tweet.create({
    user: user,
    body: "#{number}test tweet body"
  })
  favourite_tweet = InteractedTweet::Favourite.create({
    tweet: tweet,
    user: user
  })
  liked_tweet = InteractedTweet::Liked.create({
    tweet: tweet2,
    user: user
  })
end
