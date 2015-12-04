class ItemsController < ApplicationController

  get '/' do

    @items = Items.all

    erb :read

  end

  #create
  get '/create' do
    erb :create
  end

  post '/create' do

    @items = Items.all

    @item = Items.new
    @item.name = params[:name]
    @item.quantity = params[:quantity]

    if @item.save
    erb :read
    else
    erb :create
    end

  end


  #update
  get '/update/:id' do

    @item = Items.find(params[:id])

    erb :update

  end

  post '/update' do
    @items = Items.all

    @item = Items.find(params[:id])

    @item.name = params[:name]
    @item.quantity = params[:quantity]


    if @item.save
    erb :read
    else
    erb :update
    end

  end

  #destroy
  get '/destroy/:id' do
      @item = Items.find(params[:id])

      erb :destroy

  end


  post '/destroy' do
    @items = Items.all
    
    @item = Items.find(params[:id])

    if @item.destroy
      erb :read
    else
      erb :destroy
    end

  end


end
