michelle = User.create(name: "Michelle", password: "Michelle", photo_url: "https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-xpf1/v/t1.0-9/10175011_10152028609011895_3248327232259849681_n.jpg?oh=4801c06e56e582aa0e7ef08a2f03ea5c&oe=548F8F4B&__gda__=1422001204_378ef174553df3c950c2e93f2cabb6c8")
francisco = User.create(name: "Francisco", password: "Francisco" )
steve = User.create(name: "Steve", password: "Steve" )
jenn = User.create(name: "Jenn", password: "Jenn" )

Relationship.create(follower_id: 1, followed_user_id: 2)
Relationship.create(follower_id: 1, followed_user_id: 3)
Relationship.create(follower_id: 1, followed_user_id: 4)
Relationship.create(follower_id: 1, followed_user_id: 1)
Relationship.create(follower_id: 2, followed_user_id: 2)
Relationship.create(follower_id: 3, followed_user_id: 3)
Relationship.create(follower_id: 4, followed_user_id: 4)


michelle.bites.create(content: "My salad was very spicy today. A bit intimidating.")
francisco.bites.create(content: "I put my lunch in the mini oven to heat. It's been a minute.")
jenn.bites.create(content: "My quinao turned a bit green from the avocado.")
steve.bites.create(content: "My lunch ate me...")

