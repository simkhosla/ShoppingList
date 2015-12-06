require 'sinatra/base'
require './controllers/application'
require './controllers/accounts'
require './controllers/items'
require './models/account'
require './models/item'

run Sinatra::Application

map('/') { run AccountsController }
map('/items') { run ItemsController }
