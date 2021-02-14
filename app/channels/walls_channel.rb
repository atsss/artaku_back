class WallsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "wall_channel_#{params[:id]}"
  end

  def unsubscribed; end
end
