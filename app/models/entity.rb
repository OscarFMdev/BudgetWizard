class Entity < ApplicationRecord
  belongs_to :group
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author_id, presence: true
end
