module Types
  class QueryType < Types::Objects::Base
    field :artist, resolver: Queries::Shows::Artist
    field :artwork, resolver: Queries::Shows::Artwork
    field :wall, resolver: Queries::Shows::Wall
  end
end
