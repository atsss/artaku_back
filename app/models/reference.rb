# == Schema Information
#
# Table name: references
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text(65535)
#  kind        :string(255)
#  url         :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  artwork_id  :bigint           not null
#
# Indexes
#
#  index_references_on_artwork_id  (artwork_id)
#  index_references_on_deleted_at  (deleted_at)
#
class Reference < ApplicationRecord
  extend Enumerize

  belongs_to :artwork

  validates :url, presence: true

  enumerize :kind, in: %i(document code other), default: :document
end
