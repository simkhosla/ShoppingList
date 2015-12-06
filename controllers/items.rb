class ItemsController < ApplicationController


  post '/create' do

    @items = Item.all

    @item = Item.new
    @item.itemtext = params[:itemtext]
    @item.quantity = params[:quantity]

    if @item.save
    redirect '/'
    else
    @message = "Sorry, your item didn't save, try again!"
    redirect '/'
    end

  end


  #update
  post '/update/:id' do
    @items = Item.all

    @item = Item.find(params[:id])

    @item.itemtext = params[:itemtext]
    @item.quantity = params[:quantity]


    if @item.save
    redirect '/'
    else
    redirect '/'
    end

  end

  #destroy
  post '/delete/:id' do

      @items = Item.all

      @item = Item.find(params[:id])

      if @item.destroy
        redirect '/'
      else
        @message = "Sorry, this item could not be deleted"
        redirect '/'
      end

  end

end
