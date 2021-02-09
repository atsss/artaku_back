# == Schema Information
#
# Table name: work_processes
#
#  id                :bigint           not null, primary key
#  deleted_at        :datetime
#  description       :text(65535)
#  done_at           :datetime         not null
#  summary_video_url :string(255)
#  title             :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  artwork_id        :bigint           not null
#
# Indexes
#
#  index_work_processes_on_artwork_id  (artwork_id)
#  index_work_processes_on_deleted_at  (deleted_at)
#
class WorkProcess < ApplicationRecord
  belongs_to :artwork
  has_many :images, class_name: 'WorkProcessImage', dependent: :restrict_with_error
  has_many :videos, class_name: 'WorkProcessVideo', dependent: :destroy

  validates :done_at, presence: true

  def descriptions
    description&.split(/\R/)
  end

  def image_urls
    images.present? ? images.map { |image| image.url } : nil
  end

  def video_ids
    videos.present? ? videos.map { |video| self.class.extract_youtube_id(video.url) } : nil
  end

  def summary_video_id
    summary_video_url.present? ? self.class.extract_youtube_id(summary_video_url) : nil
  end
end
