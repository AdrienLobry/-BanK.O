class FavoriteListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite_list, only: [:edit, :update, :destroy]

  def index
    @favorite_lists = current_user.favorite_lists
  end

  def new
    @favorite_list = FavoriteList.new
  end

  def create
    @favorite_list = current_user.favorite_lists.build(favorite_list_params)
    if @favorite_list.save
      redirect_to meals_path(query: @favorite_list.localisation, Localiser: "Localiser"), notice: 'Nouvelle liste de favoris créée avec succès.'
    else
      redirect_to favorite_lists_path, notice: 'erreur.'
    end
  end

  def destroy
    @favorite_list.destroy
    redirect_to favorite_lists_path, notice: 'Liste supprimé avec succès.'
  end

  def edit
  end

  def update
    if @favorite_list.update(favorite_list_params)
      redirect_to favorite_lists_path, notice: 'Favoris mis à jour avec succès.'
    else
      render :edit
    end
  end

  private

  def set_favorite_list
    @favorite_list = current_user.favorite_lists.find(params[:id])
  end

  def favorite_list_params
    params.require(:favorite_list).permit(:title, :localisation)
  end
end
