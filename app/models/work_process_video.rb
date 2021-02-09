# == Schema Information
#
# Table name: work_process_videos
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  title           :string(255)
#  url             :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  work_process_id :bigint           not null
#
# Indexes
#
#  index_work_process_videos_on_deleted_at       (deleted_at)
#  index_work_process_videos_on_work_process_id  (work_process_id)
#
class WorkProcessVideo < ApplicationRecord
  belongs_to :work_process

  validates :url, presence: true
end
