class Ingredient < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    private
    def downcase_name
        self.name = name.downcase if name.present?
    end
end
