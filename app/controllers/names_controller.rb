class NamesController < ApplicationController

  before_action :get_list

  def create
    name = Name.new(name: params[:name], list: @list)
    name.manual = name.next_manual
    if name.save
      NamesChannel.broadcast_to(@list, name)
      render json: {status: "ok"}
    else
      render json: {errors: name.errors}
    end
  end

  def index
    render json: {names: @list.names}
  end

  def update
    name = Name.find(name_params[:id])
    if name
      name.update(name_params)
      name.arrange_manuals
      NamesChannel.broadcast_to(@list, name)
      render json: {status: "updated"}
    end
  end
  
  private

  def get_list
    @list = List.find_by(alphanumeric: params[:list])
  end

  def name_params
    params.require(:name).permit(:id, :crossed, :list, :manual)
  end

end
