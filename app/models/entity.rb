class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', dependent: :destroy

  validates :name, presence: true
end
