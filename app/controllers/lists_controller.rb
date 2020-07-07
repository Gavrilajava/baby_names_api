class ListsController < ApplicationController

  def show
    list = List.find_by(alphanumeric: params[:list])
    render json: list.messages
  end

  def create
    list = List.new
    if list.save
      render json: {list: list.alphanumeric}
    else 
      render list.errors
    end
  end
  

end
