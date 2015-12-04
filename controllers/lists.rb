class ListsController < ApplicationController

get '/lists' do

  @items = Items.all

  erb :lists

  end

end
