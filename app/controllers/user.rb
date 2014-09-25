require 'json'

before '/user/:id/bitefeed' do
  @authorized = true if current_user == User.find(params[:id])
end

get "/user/:id" do
  @user = User.find(params[:id])
  @bites = @user.bites.order("created_at DESC")
  @followers = @user.followers
  @followed_users = @user.followed_users

  erb :'users/show'
end

post "/user/:id" do
  @user = User.find(session[:user_id])
  if following?(User.find(params[:id]))
    @user.followed_relationships.find_by(followed_user_id: params[:id]).destroy
    return @follower_data = { "followers" => @user.followers.count-1, "following" => @user.followed_users.count-1}.to_json
    # redirect to ("/user/#{params[:id]}")
  else
    @user.followed_users << User.find(params[:id])
    return @follower_data = { "followers" => @user.followers.count-1, "following" => @user.followed_users.count-1}.to_json
    # @follower_data = [{ followers: @followers.count-1, following: followed_users.count-1}].to_json
    # redirect to ("/user/#{params[:id]}")
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