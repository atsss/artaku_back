module Queries
  module Shows
    class Artwork < Base
      type Types::Objects::Artwork, null: true

      argument :id, ID, required: true

      def resolve(id: nil)
        ::Artwork.includes(:author, processes: [:videos, { images: { main_attachment: :blob } }]).find(id)
      end
    end
  end
end
