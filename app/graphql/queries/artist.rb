module Queries
  class Artist < Base
    type Types::Objects::Artist, null: true

    argument :slug, String, required: true

    def resolve(slug: nil)
      ::User.includes(:image_attachment, artworks: { thumbnail_attachment: :blob }).where(slug: slug).first
    end
  end
end
