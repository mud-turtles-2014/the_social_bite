class Hashtag < ActiveRecord::Base
  has_many :bite_hashtags
  has_many :bites, through: :bite_hashtags
end
