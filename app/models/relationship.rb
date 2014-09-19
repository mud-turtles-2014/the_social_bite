class Relationship < ActiveRecord::Base
  belongs_to :user, foreign_key: "follower_id"
  belongs_to :user, foreign_key: "followed_user_id"
  # Remember to create a migration!
end
