# == Schema Information
#
# Table name: work_process_images
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  work_process_id :bigint           not null
#
# Indexes
#
#  index_work_process_images_on_deleted_at       (deleted_at)
#  index_work_process_images_on_work_process_id  (work_process_id)
#
class WorkProcessImage < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :work_process
  has_one_attached :main

  def url
    url_for(main)
  end
end
