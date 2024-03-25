class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [ :update, :destroy, :show]
    before_action :authenticate_request, only: [ :create, :update, :destroy]
  
    def index
      ingredients = Ingredient.all 
  
      render json: ingredients, status: 200
    end
  
    def show
      # ingredient = Ingredient.find_by(id: params[:id])
      
      render json: @ingredient, status: 200
    end
    # def show
    #   if params[:name]
    #     ingredient = Ingredient.find_by(name: params[:name])
    #   else
    #     ingredient = Ingredient.find_by(id: params[:id])
    #   end
    
    #   if ingredient
    #     render json: ingredient, status: 200
    #   else
    #     render json: { error: "Ingredient not found" }, status: :unprocessable_entity
    #   end
    # end
    def show_by_name
      ingredient = Ingredient.find_by(name: params[:name])

      render json: ingredient, status: 200
    end
  
    def create
      ingredient = Ingredient.new(ingredient_params)
      if ingredient.save
        render json: ingredient, status: :created
      else
        render json: ingredient.errors, status: :unprocessable_entity
      end
    end
  
    def update
        
      if @ingredient.update(ingredient_params)
        render json: @ingredient, status: :ok
      else
        render json: @ingredient.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @ingredient.destroy
        render json: nil, status: :ok
      else
        render json: @ingredient.errors, status: :unprocessable_entity
      end
    end

    def recipes_index
      ingredient = Ingredient.find(params[:ingredient_id])
      recipes_that_have_ingredient = ingredient.recipes
      render json: recipes_that_have_ingredient, status: :ok
    
    end
    def recipes_without_index
      ingredient = Ingredient.find(params[:ingredient_id])
      recipes_without = Recipe.where.not(id: Recipe.joins(:ingredients).where(ingredients: ingredient))
      render json: recipes_without, status: :ok
      
    end
  
    private
  
    def ingredient_params
      params.permit(:name)
    end
  
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
      
    end

    # def set_ingredient
    #   if is_number?(params[:id])
    #     @ingredient = Ingredient.find(params[:id])
    #   else
    #     @ingredient = Ingredient.find_by(name: params[:id])
    #   end
    # end
    
    def is_number?(string)
      true if Float(string) rescue false
    end
  end

