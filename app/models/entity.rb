class Entity < ApplicationRecord
  belongs_to :group 
  belongs_to :author, class_name: 'User', dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
  validates :author_id, presence: true
end
