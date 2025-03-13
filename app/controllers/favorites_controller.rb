class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite_list
  before_action :set_favorite, only: [:destroy]

  def destroy
    @favorite.destroy
    redirect_to favorite_lists_path, notice: 'Plat supprimé de la liste avec succès.'
  end

  def create
    @favorite = current_user.favorite.build(favorite_params)
    if @favorite.save!
      render "/meals/show", notice: "Le plat à été ajouté à #{@favorite.favorite_list.title}."
    else
      render "/meals/show", notice: 'Erreur, veuillez vous plaindre (poliment) à Paul.'
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
