class Category < ApplicationRecord
  has_many :meals, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
