# == Schema Information
#
# Table name: artworks
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  depth        :float(24)
#  description  :text(65535)
#  height       :float(24)        not null
#  material     :string(255)      not null
#  price        :integer
#  published_at :datetime
#  sold_at      :datetime
#  style        :string(255)      not null
#  title        :string(255)      not null
#  width        :float(24)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint           not null
#
# Indexes
#
#  index_artworks_on_author_id  (author_id)
#
class Artwork < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :thumbnail
  belongs_to :author, class_name: 'User'

  validates :title, :width, :height, :style, :material, presence: true

  def thumbnail_url
    thumbnail.attached? ?  url_for(thumbnail) : nil
  end
end
