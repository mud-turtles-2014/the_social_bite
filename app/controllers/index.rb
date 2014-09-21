get '/' do
  if session[:login_error]
    @error = session[:login_error]
    session[:login_error] = nil
  end
    erb :'index'
end

post '/' do
  @user = User.find_by(name: params[:user][:name])
  if User.exists?(name: params[:user][:name]) == false
    session[:login_error] = "Invalid ID or password."
    redirect to ('/')
  elsif @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to("/user/#{@user.id}/bitefeed")
  else
    session[:login_error] = "Invalid ID or password."
    redirect to('/')
  end
end

get '/signup' do
  if session[:signup_error]
    @error = session[:signup_error]
    session[:signup_error] = nil
  end

  erb :'signup'
end

post '/signup' do
  if params[:user][:password] != params[:user][:confirm_password]
    session[:signup_error] = "Password did not match. Please try again."
    redirect to ('/signup')
  else
    @user = User.create(name: params[:user][:name], password: params[:user][:password])
    #hacky way to order bites by created_at?
    @user.followed_users << @user
    session[:user_id] = @user.id
  redirect to("/user/#{@user.id}/bitefeed")
  end
end

get '/logout' do
  session.clear
  redirect to ('/')
end