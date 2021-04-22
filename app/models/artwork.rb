# == Schema Information
#
# Table name: artworks
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  deleted_at   :datetime
#  description  :text(65535)
#  title        :string(255)      not null
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

  validates :title, presence: true

  def thumbnail_url
    thumbnail&.url
  end

  def completed_date
    completed_at&.strftime('%Y/%-m/%-d')
  end
end
