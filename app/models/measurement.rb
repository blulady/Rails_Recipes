class Measurement < ApplicationRecord
    validates :unit_measurement, presence: true, uniqueness: { case_sensitive: false }
    has_many :recipe_ingredients
end
