class NamesChannel < ApplicationCable::Channel

  def subscribed
    list = List.find_by(alphanumeric: params[:list])
    stream_for list
  end

  def unsubscribed
  end
  
end
