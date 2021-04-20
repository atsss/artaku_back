module Types
  module Objects
    class Artwork < Base
      field :id, ID, null: false
      field :title, String, null: false
      field :thumbnail_url, String, null: true
      field :description, String, null: true
      field :completed_date, String, null: true
      field :author, Types::Objects::Artist, null: false
      field :processes, [WorkProcess], null: true
    end
  end
end
