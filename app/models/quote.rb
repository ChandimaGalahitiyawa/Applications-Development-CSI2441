class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :philosopher
  has_many :quote_categories   
  has_many :categories, through: :quote_categories

  validates :text, presence: true
end
