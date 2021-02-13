# == Schema Information
#
# Table name: walls
#
#  id          :bigint           not null, primary key
#  comment     :text(65535)
#  content_url :string(255)
#  deleted_at  :datetime
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_walls_on_deleted_at  (deleted_at)
#
class Wall < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
end
