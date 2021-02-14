module Mutations
  module Updates
    class Wall < Base
      argument :id, ID, required: true
      argument :content_url, String, required: true

      type Types::Objects::Wall

      def resolve(id: nil, content_url: nil)
        wall = ::Wall.find(id)
        wall.update!(content_url: content_url)
        ActionCable.server.broadcast("wall_channel_#{id}", wall)

        wall
      end
    end
  end
end
