enable :sessions

def login?
  if session[:username].nil?
    return false
  else
    return true
  end
end

def username
  return session[:username]
end

post '/login' do 
  @user = Player.authenticate(params[:username], params[:password])
   if @user
     session[:username] = @user[:username]
     session[:user_id] = @user[:id]
     redirect '/'
   else
      @login_error_msg = "Invalid Username/Password"
      erb :'/user/signup_and_login', layout: false
   end
end

get '/logout' do
  session[:username] = nil
  session[:round] = nil
  session[:user_id] = nil
  redirect '/'
end

get '/signup_and_login' do
  erb :'/user/signup_and_login', layout: false
end

post '/signup' do
  @user = Player.create(username: params[:username], password: params[:password])
   if !@user.new_record? #Returns true if this object hasn’t been saved yet
     session[:username] = params[:username]
     redirect "/"
  else
     @error_msg = @user.errors.full_messages
     erb :'/user/signup_and_login', layout: false
  end
end

get '/user/:id' do 
  if !login?
    redirect '/signup_and_login'
  else
     @user = Player.find_by( id: params[:id] )
     # @posts = Post.where( user_id: @user.id )
    erb :'user/user_info'
  end
end