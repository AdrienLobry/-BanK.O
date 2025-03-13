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

  def add_meal_to_favorite
    @meal = Meal.find(params[:id])
    favorite_list = current_user.favorite_lists.find(params[:favorite_list_id])
    favorite = favorite_list.favorites.build(meal: @meal)
    if favorite.save
      redirect_to meal_path(@meal), notice: 'Plat ajouté à la liste de favoris avec succès.'
    else
      redirect_to meal_path(@meal), alert: 'Erreur lors de l\'ajout du plat à la liste de favoris.'
    end
  end
end
