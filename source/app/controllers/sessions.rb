# renders sign-up page
get '/signup' do
  @user = User.new
  erb :signup
end

# sign-in page
post '/users' do
    @user = User.new(
      name: params[:name], 
      email: params[:email], 
    )
    @user.password = params[:password]
     @noms = Nom.all
   if @user.save
      erb :dashboard
    else
      status 404
      redirect '/signup'
    end
 end

get '/login' do
  erb :login
end

# login page
post '/login_users' do
  @user = User.where(email: params[:email]).first

  if @user && @user.password == params[:password]
    login(@user)
    redirect '/dashboard'
  else
    status 401
    @login_error = "Uh Oh! Your Email or Password is wrong"
    redirect '/login'
  end
end

get '/dashboard' do
  @user = current_user
  @noms = Nom.all
  erb :dashboard
end

get '/logout' do
  logout!
  redirect to('/')
end
