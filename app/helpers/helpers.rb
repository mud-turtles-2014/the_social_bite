helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def following?(bite_user)
    user = User.find(session[:user_id])
    following = user.followed_users.select {|followed_user| followed_user == bite_user}
    following.length == 0 ? false : true
  end

  def followers_bites
    bite_feed = []
    user = User.find(session[:user_id])
    user.followed_users.each {|user| bite_feed << user.bites.order("created_at DESC")}
    bite_feed.flatten
  end

  def check_for_hashtags(bite_object)
    bite_object.content.split(" ").each do |word|
      bite_object.hashtags << Hashtag.find_or_create_by(hashtag: word[1..-1]) if word[0] == "#"
    end
  end

  def trending_hashtags
    Hashtag.all.order("bites_count DESC").limit(5)
  end
end

# User.order("users.solutions_count DESC").limit(10)
