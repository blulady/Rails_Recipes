# frozen_string_literal: true

class CategoryBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :description, :link
    view :normal do
        fields :name
    end
    association :recipes, blueprint: RecipeBlueprint
end
