# == Schema Information
#
# Table name: user_images
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_images_on_deleted_at  (deleted_at)
#  index_user_images_on_user_id     (user_id)
#
class UserImage < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_one_attached :main

  def url
    url_for(main)
  end
end
