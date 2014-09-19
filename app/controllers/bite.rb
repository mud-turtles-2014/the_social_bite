get '/bite/new' do

  erb :'bites/new'
end

post '/bite/new' do
  Bite.create(params[:bite_body])

  redirect to ("user/#{session[:user_id]}/newsfeed")
end

get '/bite/:id' do
  @bite = Bite.find(params[:id])

  erb :'bites/show'
end




