get '/' do
@finstagram_posts = FinstagramPost.order(created_at: :desc)
p @finstagram_posts.to_s
    erb(:index)
end

get '/signup'do #if a user navigates to the path "/signup",
    @user = User.new #setup empty @user object
    erb(:signup)    #render "app/views/signup.erb"
end

post '/signup' do 
    email = params[:email]
    avatar_url = params[:avatar_url]
    username = params[:username]
    password = params[:password]

    user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password})
    user.save

    escape_html user.inspect
end