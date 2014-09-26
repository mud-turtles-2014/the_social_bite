class User < ActiveRecord::Base
  has_secure_password

  has_many :bites
  has_many :follower_relationships, class_name: "Relationship", foreign_key: :followed_user_id
  #Determine your followers by finding where your id is the followed_user_id
  has_many :followed_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :followed_users, through: :followed_relationships, source: :followed_user

  # scope :following, ->(following) { where(:follower_id => following AND :followed_user_id => self.id) }
end
