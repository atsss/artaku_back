module Types
  module Objects
    class Artwork < Base
      field :id, ID, null: false
      field :title, String, null: false
      field :description, String, null: true
      field :width, Float, null: false
      field :height, Float, null: false
      field :style, String, null: false
      field :material, String, null: false
      field :created_at, Types::Scalars::DateTime, null: false
      field :completed_at, Types::Scalars::DateTime, null: true
    end
  end
end
