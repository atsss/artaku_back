# == Schema Information
#
# Table name: artworks
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  deleted_at   :datetime
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
#  index_artworks_on_author_id   (author_id)
#  index_artworks_on_deleted_at  (deleted_at)
#
class Artwork < ApplicationRecord
  has_one :thumbnail, -> { order(id: :desc) }, class_name: 'ArtworkImage'
  has_many :images, class_name: 'ArtworkImage', dependent: :restrict_with_error
  has_many :processes, class_name: 'WorkProcess', dependent: :restrict_with_error
  belongs_to :author, class_name: 'User'

  validates :title, :width, :height, :style, :material, presence: true

  def thumbnail_url
    thumbnail&.url
  end

  def painting_method
    "#{style} on #{material}"
  end

  def size
    "#{height}x#{width}mm"
  end
end
