helpers do

  def current_user
  @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

end# Homepage (Root path)


get '/' do
  erb :index
end

get '/login' do
    erb :login
end

get '/signup' do
    erb :signup
end
 
get '/profile' do
    erb :profile
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user.password == password
    session[:user_id] = user.id
    redirect '/profile'
  else
    redirect '/login'
  end
end

post '/signup' do
  # puts params

  username = params[:username]
  password = params[:password]
  name = params
  lastname

  user_by_firstname = User.find_by(email: email)
  user_by_username = User.find_by(username: username)
  if user_by_username || user_by_firstname
    redirect '/signup'
  else
    user = User.create(username: username, password: password)
    session[:user_id] = user.id
    redirect '/'
  end
end

post '/profile' do
  redirect '/'
end  