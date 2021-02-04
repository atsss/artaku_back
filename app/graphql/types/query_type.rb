module Types
  class QueryType < Types::Objects::Base
    field :artist, resolver: Queries::Artist
  end
end
