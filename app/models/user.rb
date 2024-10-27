class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quotes, dependent: :destroy
  has_one_attached :profile_photo

  enum status: { active: 0, suspended: 1, banned: 2 }

  validates :first_name, presence: true
  validates :last_name, presence: true

  # Helper methods for admin checks
  def admin?
    is_admin
  end

  def make_admin!
    update(is_admin: true)
  end

  def remove_admin!
    update(is_admin: false)
  end
end

