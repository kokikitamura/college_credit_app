class Category < ApplicationRecord
  belongs_to :user
  has_many :courses, dependent: :destroy
  has_ancestry
  default_scope -> { order(created_at: :asc) }
  validates :user_id, presence: true
  validates :name, presence: true
  validates :credits, presence: true
end
