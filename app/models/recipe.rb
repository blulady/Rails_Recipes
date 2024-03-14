class Recipe < ApplicationRecord
include Rails.application.routes.url_helpers
    # active storage 
    has_one_attached :recipe_image


    validates :name, :instructions, :cooking_time, presence: true
    validate :correct_file_type

    has_and_belongs_to_many :users
    has_and_belongs_to_many :categories
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :reviews

    def average_review
        reviews.average(:rating) || 0
    end

    def correct_file_type
        return unless recipe_image.attached?

        acceptable_types = ['image/jpeg', 'image/png', 'image/gif']
        unless acceptable_types.include?(recipe_image.content_type)
            errors.add(:recipe_image, 'is not a valid image type')
        end
    end

    def recipes_image_url
        rails_blob_url(self.recipe_image, only_path: false) if self.recipe_image.attached?
    end
end
