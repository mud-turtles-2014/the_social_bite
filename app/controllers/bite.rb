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

  redirect to "user/#{session[:user_id]}/bitefeed"
end