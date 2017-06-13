post '/comments/new' do
  @comments = Comment.new(body: params[:body], user_id: session[:user_id], post_id: session[:post_id])
  if @comments.save
    redirect "/posts/#{session[:post_id]}"
  else
    erb :'posts/show'
  end
end
