# == Schema Information
#
# Table name: work_processes
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text(65535)
#  done_at     :datetime         not null
#  video_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  artwork_id  :bigint           not null
#
# Indexes
#
#  index_work_processes_on_artwork_id  (artwork_id)
#  index_work_processes_on_deleted_at  (deleted_at)
#
class WorkProcess < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :artwork
  has_many_attached :images # FIXME: should use has_many: work_process_images

  validates :done_at, presence: true

  def descriptions
    description.split(/\R/)
  end

  def image_urls
    images.attached? ? images.map { |image| url_for(image) } : nil
  end
end
