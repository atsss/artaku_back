module Queries
  class Artwork < Base
    type Types::Objects::Artwork, null: true

    argument :id, ID, required: true

    def resolve(id: nil)
      ::Artwork.includes(processes: { images_attachments: :blob }).find(id)
    end
  end
end
