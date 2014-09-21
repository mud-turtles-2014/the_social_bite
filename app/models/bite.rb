class Bite < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :bite_hashtags
  has_many :hashtags, through: :bite_hashtags
end
