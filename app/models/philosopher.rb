class Philosopher < ApplicationRecord
    has_many :quotes, dependent: :destroy
    has_one_attached :profile_photo

    def full_name
        "#{first_name} #{last_name}"
      end
  
    validates :first_name, presence: true
    validates :last_name, presence: true
end