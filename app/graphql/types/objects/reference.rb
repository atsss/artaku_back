module Types
  module Objects
    class Reference < Base
      field :id, ID, null: false
      field :kind, String, null: true
      field :description, String, null: true
      field :url, String, null: false
    end
  end
end
