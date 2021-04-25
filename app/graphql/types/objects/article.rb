module Types
  module Objects
    class Article < Base
      field :id, ID, null: false
      field :title, String, null: false
      field :description, String, null: false
      field :url, String, null: false
      field :published_date, String, null: false
    end
  end
end
