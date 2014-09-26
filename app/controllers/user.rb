require 'json'

before '/user/:id/bitefeed' do
  @authorized = true if current_user == User.find(params[:id])
end

get "/user/:id" do
  @user = User.find(params[:id])
  @bites = @user.bites.order("created_at DESC")
  following?(@user) ? @btn_display = "UNBite Me" : @btn_display = "Bite Me"

  erb :'users/show'
end

post "/user/:id" do
  #SCOPE OUT FOLLOW/UNFOLLOW
  @user = User.find(session[:user_id])
  # p @user
  # p session[:user_id]
  # p "*" * 50
  # p params
  # p "*" * 50
  # p following?(User.find(params[:id]))
  # p "*" * 50
  # p User.find(params[:id])

  if following?(User.find(params[:id]))

   @user.followed_relationships.find_by(followed_user_id: params[:id]).destroy

    erb :'_follow_info', layout: false
  else
    @user.followed_users << User.find(params[:id])

    erb :'_follow_info', layout: false
  end
end

get "/user/:id/bitefeed" do
  if @authorized == false
    redirect to ("/user/#{session[:user_id]}/bitefeed")
  end

  @user = User.find(session[:user_id])
  @bite_feed = followers_bites
  @trending_hashtags = trending_hashtags

  erb :'users/bitefeed'
end

$placeholder_sayings = ["Everyone is so interested in what you're eating...", "Whatcha biting on?", "Yum that looks good, you should tell everyone!", "Nom Nom Nom", "Don't forget to #foodporn", "Everyone's going to be so jealous when they see this.", "Oh, I'm so interested, please tell me more."]

post "/user/:id/new" do
  @user = User.find(session[:user_id])
  @bite = @user.bites.create(content: params[:bite_content])

  erb :'_bite_display', locals: {bite: @bite}, layout: false
end