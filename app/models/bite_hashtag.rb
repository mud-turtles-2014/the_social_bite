class BiteHashtag < ActiveRecord::Base
  belongs_to :bite
  belongs_to :hashtag
end
