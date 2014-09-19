get "/user/:id" do
  @user = User.find(params[:id])
  @bites = @user.bites
  @followers = @user.followers
  @followed_users =
  erb :'users/show'
end

get "/user/:id/newsfeed" do

end

