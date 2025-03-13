class AddFavoriteListReferencesToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_reference :favorites, :favorite_list, index: true, foreign_key: true
  end
end
