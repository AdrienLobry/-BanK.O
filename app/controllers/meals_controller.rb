class MealsController < ApplicationController
  def index
    @meals = Meal.all
    if params[:query].present?
      @meals = @meals.near(params[:query], 20)
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end
end
