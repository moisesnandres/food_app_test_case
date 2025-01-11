class Meal < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  before_validation :set_default_price, on: :create

  private

  def set_default_price
    self.price ||= generate_price
  end

  def generate_price
    case category.name.downcase
    when 'lamb'
      rand(45..100)
    when 'beef'
      rand(35..80)
    when 'pork'
      rand(25..60)
    else
      rand(10..100)
    end
  end
end
