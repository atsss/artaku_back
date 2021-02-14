module Types
  class QueryType < Types::Objects::Base
    field :artist, resolver: Queries::Artist
    field :artwork, resolver: Queries::Artwork
    field :wall, resolver: Queries::Wall
  end
end
