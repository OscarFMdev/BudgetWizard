class Group < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :whose_name_starts_with,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }

  has_one_attached :icon

  validates :name, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :entities, dependent: :destroy

  validates :author, presence: true
end
