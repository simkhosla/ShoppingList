class ApplicationController < Sinatra::Base

<<<<<<< HEAD
require 'bundler'
Bundler.require
=======
  ActiveRecord::Base.establish_connection(
    :database => 'shoppinglistapp',
    :adapter => 'postgresql'
  )
>>>>>>> 6a431519aa6cc323109b3b964cb91e649be5728b

ActiveRecord::Base.establish_connection(
  :database => 'shoppinglistapp',
  :adapter => 'postgresql'
)

set :views, File.expand_path('../../views', __FILE__)
set :public_dir, File.expand_path('../../public', __FILE__)


# this will go in ApplicationController
# we want to enable sessions
enable :sessions


# helper method to see if username exists
def does_user_exist(username)
  user = Account.find_by(:user_name => username)
  if user
    return true
  else
    return false
  end
end

def authorization_check
  if session[:current_user] == nil
    redirect '/not_authorized'
  else
    return true
  end
end


get '/lists' do


  erb :lists

end


get '/' do

  authorization_check

  @user_name = session[:current_user].user_name

  erb :lists

end



get '/register' do

  erb :register

end

post '/register' do

  p params
  # check ig the user someone is trying to register exists or not
  if does_user_exist(params[:user_name]) == true
  # return erb :view_name ---- if you'd rather send to a different page instead of the JSON message
  end
  # if we make it this far, the user does not exist. so let's make it!
  user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])

  p user

  session[:current_user] = user

  redirect '/'  #instead of calling a view to render, redirect to a route. this forces the route to change. the URL will change.

end

get '/login' do

  erb :login

end

post '/login' do
    user = Account.authenticate(params[:user_name], params[:password])

    if user
      session[:current_user] = user
      redirect '/lists'
    else
      @message = "Your password is incorrect"
    end

end

get '/logout' do
  authorization_check
  session[:current_user] = nil
  redirect '/'
end

get '/not_authorized' do

  erb :not_authorized

end

#
# not_found do
#   erb :not_found
# end

end
