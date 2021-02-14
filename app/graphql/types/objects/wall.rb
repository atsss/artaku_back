module Types
  module Objects
    class Wall < Base
      field :id, ID, null: false
      field :name, String, null: false
      field :content_url, String, null: true
      field :comment, String, null: true
    end
  end
end
