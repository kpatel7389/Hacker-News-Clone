get '/users' do
  erb :index
end

get '/users/register' do
  erb :'users/register'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/register'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if authorized?(@user.id)
    erb :'users/show'
  else
    redirect "/"
  end
end




