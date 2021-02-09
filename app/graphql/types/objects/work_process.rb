module Types
  module Objects
    class WorkProcess < Base
      field :id, ID, null: false
      field :descriptions, [String], null: true
      field :summary_video_url, String, null: true
      field :image_urls, [String], null: true
      field :video_urls, [String], null: true
      field :done_at, Types::Scalars::DateTime, null: false
    end
  end
end
