# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  deleted_at    :datetime
#  description   :text(65535)
#  facebook_url  :string(255)
#  github_url    :string(255)
#  instagram_url :string(255)
#  linkedin_url  :string(255)
#  medium_url    :string(255)
#  name          :string(255)      not null
#  slug          :string(255)      not null
#  twitter_url   :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#  index_users_on_slug        (slug) UNIQUE
#
class User < ApplicationRecord
  has_one :image, -> { order(id: :desc) }, class_name: 'UserImage', dependent: :restrict_with_error
  has_many :articles, dependent: :destroy
  has_many :ordered_articles, -> { order_by_published_at }, class_name: 'Article'
  has_many :artworks, foreign_key: :author_id, dependent: :restrict_with_error
  has_many :ordered_artworks, -> { order_by_completed_at }, foreign_key: :author_id, class_name: 'Artwork'

  validates :slug, :name, presence: true
  validates :slug, uniqueness: true

  def descriptions
    description&.split(/\R/)
  end

  def image_url
    image&.url
  end
end
