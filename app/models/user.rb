class User < ActiveRecord::Base
  has_secure_password

  has_many :bites
  has_many :follower_relationships, foreign_key: :follower_id, class_name: "Relationship" # TODO: Get queries working properly. Matt switched the foreign keys on lines 5 and 6 with one another, and the associations worked properly. But this may not be the symantically correct way to do this. Read Michael Hartl site!!!!
  has_many :followed_relationships, foreign_key: :followed_user_id, class_name: "Relationship"
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followed_users, through: :followed_relationships, source: :followed_user
  # Remember to create a migration!
end
