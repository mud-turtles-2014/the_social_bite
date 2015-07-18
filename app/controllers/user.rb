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
  @user = User.find(session[:user_id])
  @user_on_page = User.find(params[:id])
  if following?(@user_on_page)

   @user.followed_relationships.find_by(followed_user_id: params[:id]).destroy
    erb :'/partials/_follow_info', layout: false
  else
    @user.followed_users << @user_on_page
    erb :'/partials/_follow_info', layout: false
  end
end

 $PLACEHOLDER_SAYINGS = ["Everyone is so interested in what you're eating...", "Whatcha biting on?", "Yum that looks good, you should tell everyone!", "Nom Nom Nom", "Don't forget to #foodporn", "Everyone's going to be so jealous when they see this.", "Oh, I'm so interested, please tell me more."]

get "/user/:id/bitefeed" do
  if @authorized == false
    redirect to ("/user/#{session[:user_id]}/bitefeed")
  end

  @user = User.find(session[:user_id])
  @bite_feed = followers_bites
  @trending_hashtags = trending_hashtags

  erb :'users/bitefeed'
end

post "/user/:id/new" do
  @user = User.find(session[:user_id])
  @bite = @user.bites.create(content: params[:bite_content])

  erb :'/partials/_bite_display', locals: {bite: @bite}, layout: false
end

get "/user/:id/followers" do
  @user = User.find(params[:id])
  @users_followers = User.find(params[:id]).followers
  @followers = @users_followers - [@user]
  @users_following = User.find(params[:id]).followed_users
  @following = @users_following - [@user]

  erb :'users/followers'
end

# get "/user/:id/following" do
#   @user = User.find(params[:id])
#   @followers = []

#   erb :'users/followers'
# end