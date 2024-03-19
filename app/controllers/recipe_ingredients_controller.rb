class RecipeIngredientsController < ApplicationController
    before_action :set_recipe_ingredient, only: [ :update, :destroy, :show]
    before_action :authenticate_request, only: [ :update, :destroy, :create]
  
    def index
      recipe_ingredients = RecipeIngredient.all 
      render json: RecipeIngredientBlueprint.render_as_hash(recipe_ingredients, view: :normal), status: 200
  
      # render json: recipe_ingredients, status: 200
    end
  
    def show
      render json: RecipeIngredientBlueprint.render_as_hash(@recipe_ingredient, view: :normal), status: 200
      # render json: @recipe_ingredient, status: 200
    end
  
    def create
      recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
      if recipe_ingredient.save
        render json: recipe_ingredient, status: :created
      else
        render json: recipe_ingredient.errors, status: :unprocessable_entity
      end
    end
  
    def update
        
      if @recipe_ingredient.update(recipe_ingredient_params)
        render json: @recipe_ingredient, status: :ok
      else
        render json: @recipe_ingredient.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @recipe_ingredient.destroy
        render json: nil, status: :ok
      else
        render json: @recipe_ingredient.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def recipe_ingredient_params
      params.permit(:recipe_id, :ingredient_id, :measurement_id, :ingredient_amount)
    end
  
    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end
  end
