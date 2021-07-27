get '/login' do
    erb(:login)
end

post '/login' do
    username = params[:username]
    password = params[:password]
      
    @user = User.find_by(username: username)
      
    if @user && @user.password == password
        session[:user_id] = @user.id
        "Success! User with id #{session[:user_id]} is logged in!"
    else
        @error_message = "Login failed."
        erb(:login)
    end
end

get '/logout'do
    session[:user_id] = nil
    "Logout Successful"
end


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

    @user= User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

    if @user.save
        "User #{username} saved!"
    else
        erb(:signup)
end 

end