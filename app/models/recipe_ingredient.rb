class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measurement
  validates :ingredient_amount, presence: true, length: {minimum: 1, maximum: 1000}, uniqueness: :true
end
