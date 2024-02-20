class CreateRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.references :measurement, null: false, foreign_key: true
      t.float :ingredient_amount

      t.timestamps
    end
  end
end
