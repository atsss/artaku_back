# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text(65535)
#  name        :string(255)      not null
#  slug        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#  index_users_on_slug        (slug) UNIQUE
#
class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :image
  has_many :artworks, foreign_key: :author_id, dependent: :restrict_with_error
  has_many :shootings, foreign_key: :author_id, dependent: :destroy

  validates :slug, :name, presence: true
  validates :slug, uniqueness: true

  def descriptions
    description.split(/\R/)
  end

  def image_url
    image.attached? ? url_for(image) : nil
  end
end
