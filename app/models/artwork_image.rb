# == Schema Information
#
# Table name: artwork_images
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :bigint           not null
#
# Indexes
#
#  index_artwork_images_on_artwork_id  (artwork_id)
#  index_artwork_images_on_deleted_at  (deleted_at)
#
class ArtworkImage < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :artwork
  has_one_attached :main

  def url
    url_for(main)
  end
end
