before "/bite/:id/edit" do
  @bite = Bite.find(params[:id])
  @authorized = true if current_user == User.find(@bite.author)
end

get "/bite/:id/edit" do
  if @authorized != true
    redirect to "user/#{session[:user_id]}/bitefeed"
  end
  erb :'/bites/edit'
end

put "/bite/:id/edit" do
  @bite.update(content: params[:bite_content])
  #CHECK FOR NEW HASHTAGS AND DESTROY FROM OLD
  #check_for_hashtags(@bite)

  redirect to "user/#{session[:user_id]}/bitefeed"
end

delete "/bite/:id" do
  Bite.find(params[:id]).destroy

  redirect to "user/#{session[:user_id]}/bitefeed"
end