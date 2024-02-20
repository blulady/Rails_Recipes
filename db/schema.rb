# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_20_221947) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_recipes", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "recipe_id", null: false
    t.index ["category_id", "recipe_id"], name: "index_categories_recipes_on_category_id_and_recipe_id"
    t.index ["recipe_id", "category_id"], name: "index_categories_recipes_on_recipe_id_and_category_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.string "unit_measurement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "ingredient_id", null: false
    t.integer "measurement_id", null: false
    t.float "ingredient_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["measurement_id"], name: "index_recipe_ingredients_on_measurement_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "servings"
    t.string "img_url"
    t.text "instructions"
    t.string "difficulty_level"
    t.integer "cooking_time"
    t.string "meal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes_users", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id", null: false
    t.index ["recipe_id", "user_id"], name: "index_recipes_users_on_recipe_id_and_user_id"
    t.index ["user_id", "recipe_id"], name: "index_recipes_users_on_user_id_and_recipe_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.datetime "date"
    t.integer "recipe_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "measurements"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
end
