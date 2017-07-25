get '/posts' do
  redirect '/'
end

get '/posts/new' do
  if request.xhr?
    erb :'/posts/_post_form', layout: false
  else
    erb :'posts/new'
  end
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
  @comments = @post.comments
  erb :'posts/show'
end



