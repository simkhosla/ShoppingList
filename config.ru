require 'sinatra/base'
require './controllers/application'
require './controllers/accounts'
require './controllers/items'
require './controllers/todos'
require './models/account'
require './models/item'
require './models/todo'

run Sinatra::Application

map('/') { run AccountsController }
map('/items') { run ItemsController }
map('/todos') { run ToDosController }
