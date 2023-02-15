class Group < ApplicationRecord
  has_one_attached :icon

  validates :name, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :entities, dependent: :destroy

  validates :author, presence: true
end
