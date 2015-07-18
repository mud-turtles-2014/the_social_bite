class BiteHashtag < ActiveRecord::Base
  belongs_to :bite, counter_cache: :hashtags_count
  belongs_to :hashtag, counter_cache: :bites_count
end
