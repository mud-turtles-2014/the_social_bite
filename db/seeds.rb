michelle = User.create(name: "Michelle", password: "Michelle" )
francisco = User.create(name: "Francisco", password: "Francisco" )
steve = User.create(name: "Steve", password: "Steve" )
jenn = User.create(name: "Jenn", password: "Jenn" )

Relationship.create(follower_id: 1, followed_user_id: 2)
Relationship.create(follower_id: 1, followed_user_id: 3)
Relationship.create(follower_id: 1, followed_user_id: 4)

michelle.bites.create(content: "My salad was very spicy today. A bit intimidating.")
francisco.bites.create(content: "I put my lunch in the mini oven to heat. It's been a minute.")
jenn.bites.create(content: "My quinao turned a bit green from the avocado.")
steve.bites.create(content: "My lunch ate me...")

