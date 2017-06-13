get '/posts' do
  redirect '/'
end

get '/posts/new' do
  erb :'posts/new'
end

post '/posts' do
  @posts = Post.new(title: params[:title], user_id: session[:user_id])
  if @posts.save
    redirect "/posts/#{@posts.id}"
  else
    erb :'posts/new'
  end
end


get '/posts/:id' do
  session[:post_id] = params[:id]
  @post = Post.find(params[:id])
  erb :'posts/show'
end



