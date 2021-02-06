module Types
  module Objects
    class Artist < Base
      field :id, ID, null: false
      field :slug, String, null: false
      field :name, String, null: false
      field :descriptions, [String], null: true
      field :created_at, Types::Scalars::DateTime, null: false
      field :artworks, [Artwork], null: true
    end
  end
end
