# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  name        :string(255)      not null
#  slug        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_users_on_slug  (slug) UNIQUE
#
class User < ApplicationRecord
  validates :slug, :name, presence: true
  validates :slug, uniqueness: true
end
