get '/users' do
  erb :index
end

get '/register' do
  if request.xhr?
    erb :'/users/_register_form', layout: false
  else
    erb :'users/register'
  end
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

get '/login' do
  @user = User.find_by(id: params[:id])
  if request.xhr?
    erb :'/users/_login_form', layout: false, locals: {user: @user}
  else
    erb :'users/login'
  end
end

post '/login' do
   @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Invalid Email and/or Password"]
    erb :'users/login'
  end
end


delete '/logout' do
  session[:user_id] = nil
  redirect "/"
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
    erb :'users/show'
end

get '/users/:id/comments' do
  @user = User.find(params[:id])
  @user_comments = @user.comments
  if request.xhr?
    erb :'/users/_comments', layout: false, locals: {user_comments: @user_comments}
  else
    erb :'users/comments'
  end
end

get '/users/:id/posts' do
  @user = User.find(params[:id])
  @post = Post.find(params[:id])
  @user_posts = @user.posts
  erb :'users/posts'
end






