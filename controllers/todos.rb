class ToDosController < ApplicationController


  post '/create' do

    @todos = ToDo.all

    @todo = ToDo.new
    @todo.itemtext = params[:itemtext]

    if @todo.save
    redirect '/'
    else
    @message = "Sorry, your To Do didn't save, try again!"
    redirect '/'
    end

  end


  #update
  post '/update/:id' do
    @todos = ToDo.all

    @todo = ToDo.find(params[:id])

    @todo.itemtext = params[:itemtext]


    if @todo.save
    redirect '/'
    else
    redirect '/'
    end

  end

  #destroy
  post '/delete/:id' do

      @todo = ToDo.all

      @todo = ToDo.find(params[:id])

      if @todo.destroy
        redirect '/'
      else
        @message = "Sorry, this item could not be deleted"
        redirect '/'
      end

  end

end
