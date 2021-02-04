module Queries
  class Artist < Base
    type Types::Objects::Artist, null: true

    argument :slug, String, required: true

    def resolve(slug: nil)
      ::User.includes(:artworks).where(slug: slug).first
    end
  end
end
