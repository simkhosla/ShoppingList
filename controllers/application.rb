class ApplicationController < Sinatra::Base

require 'bundler'
Bundler.require

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
  @items = Item.all
  erb :lists

end


not_found do
  erb :not_found
end

get '/' do
  @items = Item.all
  erb :lists

end



end
