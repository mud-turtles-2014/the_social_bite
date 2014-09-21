get '/' do
  if session[:login_error]
    @error = session[:login_error]
    session[:login_error] = nil
  end
    erb :'index'
end

post '/' do
  @user = User.find_by(name: params[:user][:name])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to("/user/#{@user.id}/bitefeed")
  else
    session[:login_error] = "Invalid ID or password."
    redirect to('/')
  end
end

get '/signup' do
  if session[:password_signup]
    @error = session[:password_signup]
    session[:password_signup] = nil
  end

  erb :'signup'
end

post '/signup' do
  if params[:user][:password] != params[:user][:confirm_password]
    session[:password_signup] = "Password did not match. Please try again."
    redirect to ('/signup')
  else
    @user = User.create(params[:user])
  redirect to("/user/#{@user.id}/bitefeed")
  end
end

get '/logout' do
  session.clear
  redirect to ('/')
end