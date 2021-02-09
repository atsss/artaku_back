module Types
  module Objects
    class Artist < Base
      field :id, ID, null: false
      field :slug, String, null: false
      field :name, String, null: false
      field :image_url, String, null: true
      field :descriptions, [String], null: true
      field :artworks, [Artwork], null: true
    end
  end
end
