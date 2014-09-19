class User < ActiveRecord::Base
  has_secure_password

  has_many :bites
  has_many :follower_relationships, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followed_relationships, foreign_key: :followed_user_id, class_name: "Relationship"
  has_many :followers, through: :relationships, source: :user, foreign_key: :follower_id
  has_many :followed_users, through: :relationships, source: :user, foreign_key: :followed_user_id
  # Remember to create a migration!
end
