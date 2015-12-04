require 'sinatra/base'
require './controllers/application'
require './controllers/accounts'
require './controllers/lists'
require './models/account'
require './models/item'
run Sinatra::Application

map('/') { run AccountsController }
map('/') { run ListsController }
