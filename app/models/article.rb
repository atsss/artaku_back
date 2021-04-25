# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  description  :string(255)
#  published_at :datetime
#  title        :string(255)      not null
#  url          :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_articles_on_deleted_at  (deleted_at)
#  index_articles_on_user_id     (user_id)
#
class Article < ApplicationRecord
  belongs_to :user

  validates :title, :description, :url, :published_at, presence: true

  scope :order_by_published_at, -> { order(published_at: :desc) }
end
