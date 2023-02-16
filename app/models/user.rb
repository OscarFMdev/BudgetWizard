class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: %i[user moderator admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    role || :user
  end

  has_one_attached :avatar
  has_many :entities
  has_many :groups

  validates :name, presence: true
  validates :email, presence: true
end
