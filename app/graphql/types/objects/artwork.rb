module Types
  module Objects
    class Artwork < Base
      field :id, ID, null: false
      field :title, String, null: false
      field :thumbnail_url, String, null: true
      field :description, String, null: true
      field :size, String, null: false
      field :painting_method, String, null: false
      field :created_at, Types::Scalars::DateTime, null: false
      field :completed_at, Types::Scalars::DateTime, null: true
      field :author, Types::Objects::Artist, null: false
    end
  end
end
