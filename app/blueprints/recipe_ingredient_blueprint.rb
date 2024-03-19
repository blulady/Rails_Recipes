# frozen_string_literal: true

class RecipeIngredientBlueprint < Blueprinter::Base
    identifier :id
    view :normal do
        fields :ingredient_amount
    end
    association :ingredient, blueprint: IngredientBlueprint
    association :measurement, blueprint: MeasurementBlueprint
    association :recipe, blueprint: RecipeBlueprint
end
