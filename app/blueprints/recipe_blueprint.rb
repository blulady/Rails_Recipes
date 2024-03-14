# frozen_string_literal: true

class RecipeBlueprint < Blueprinter::Base
    identifier :id
    view :normal do
        fields :name, :description, :servings, :img_url, :instructions, :difficulty_level, :cooking_time, :meal
    
        association :ingredients, blueprint: IngredientBlueprint, exclude: [:recipes]
        association :reviews, blueprint: ReviewBlueprint, exclude: [:recipes]
        association :categories, blueprint: CategoryBlueprint, exclude: [:recipes]
    end

    view :long do
        fields :name, :description, :servings, :img_url, :instructions, :difficulty_level, :cooking_time, :meal, :ingredients, :reviews, :categories, :recipes_image_url
        association :ingredients, blueprint: IngredientBlueprint, exclude: [:recipes]
        association :reviews, blueprint: ReviewBlueprint, exclude: [:recipes]
        association :categories, blueprint: CategoryBlueprint, exclude: [:recipes]
    end
end



# class RecipeBlueprint < Blueprinter::Base
#     identifier :id
#     view :normal do
#         fields :name, :description, :servings, :img_url, :instructions, :difficulty_level, :cooking_time, :meal
#     end
# end