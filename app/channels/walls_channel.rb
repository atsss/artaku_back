class WallsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'wall_channel'
  end

  def unsubscribed; end
end
