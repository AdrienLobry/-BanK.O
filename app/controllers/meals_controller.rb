class MealsController < ApplicationController
  def index
    @meals = Meal.all
    if params[:query].present?
      @meals = @meals.near(params[:query], 20)
    end
  end

  def show
    @meal = Meal.find(params[:id])
    @restaurants = @meal.restaurants
  end

  def show_recipe
    @meal = Meal.find(params[:meal_id])
    @recipe = Recipe.find(@meal.recipe_id)
    render 'recipes/show'
  end
end
