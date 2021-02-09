# == Schema Information
#
# Table name: shootings
#
#  id           :bigint           not null, primary key
#  address      :string(255)      not null
#  city         :string(255)
#  conducted_at :datetime         not null
#  deleted_at   :datetime
#  description  :text(65535)
#  state        :string(255)
#  zip          :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint           not null
#
# Indexes
#
#  index_shootings_on_author_id   (author_id)
#  index_shootings_on_deleted_at  (deleted_at)
#
class Shooting < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :address, :conducted_at, presence: true
end
