module Queries
  module Shows
    class Artist < Base
      type Types::Objects::Artist, null: true

      argument :slug, String, required: true

      def resolve(slug: nil)
        ::User.includes(
          image: { main_attachment: :blob },
          ordered_artworks: [:references, { thumbnail: {  main_attachment: :blob  } }]
        ).where(slug: slug).first
      end
    end
  end
end
