# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id
    fields :first_name
    view :normal do 
        fields :email, :first_name, :last_name
    end
    view :with_favorite_recipes do
        association :favorite_recipes, blueprint: RecipeBlueprint
    end
    view :me do
        fields :email, :first_name, :last_name
    end
    view :with_recipes do
        association :reviews, blueprint: ReviewBlueprint
    end
end
