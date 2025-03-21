class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite_list, except: :create
  before_action :set_favorite, only: [:destroy]

  def destroy
    @favorite.destroy
    redirect_to favorite_lists_path, notice: 'Plat supprimé de la liste avec succès.'
  end

  def create
    @meal = Meal.find(params[:id])
    city = Geocoder.search([@meal.latitude, @meal.longitude]).first.data["context"]&.find { |c| c["id"].start_with?("place.") }&.dig("text")

    favorite_list = current_user.favorite_lists.find_by_title(city)
    if favorite_list
      favorite = favorite_list.favorites.build(meal: @meal)
    else
      new_fav_list = FavoriteList.create!(user: current_user, title: city, localisation: city)
      favorite = new_fav_list.favorites.build(meal: @meal)
    end


    if favorite.save
      if params[:action] == "show"
        redirect_to favorite_lists_path
        # redirect_to meal_path(@meal), notice: 'Plat ajouté à la liste de favoris avec succès.'
      else
        redirect_to favorite_lists_path
        # redirect_to meals_path(query: favorite_list.localisation, Localiser: "Localiser"), notice: 'Plat ajouté à la liste de favoris avec succès.'
      end
    else
      if params[:action] == "show"
        redirect_to meal_path(@meal), alert: 'Erreur lors de l\'ajout du plat à la liste de favoris, veuillez vous plaindre (poliment) à Paul.'
      else
        redirect_to meals_path(query: favorite_list.localisation, Localiser: "Localiser"), alert: 'Erreur lors de l\'ajout du plat à la liste de favoris, veuillez vous plaindre (poliment) à Paul.'
      end
    end
  end


  private

  def set_favorite_list
    @favorite_list = current_user.favorite_lists.find(params[:favorite_list_id])
  end

  def set_favorite
    @favorite = @favorite_list.favorites.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:meal_id, :favorite_list_id)
  end
end
