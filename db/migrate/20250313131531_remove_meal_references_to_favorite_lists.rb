class RemoveMealReferencesToFavoriteLists < ActiveRecord::Migration[7.1]
  def change
    remove_reference :favorite_lists, :meal, index: true, foreign_key: true
  end
end
