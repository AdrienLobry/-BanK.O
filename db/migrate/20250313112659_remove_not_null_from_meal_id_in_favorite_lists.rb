class RemoveNotNullFromMealIdInFavoriteLists < ActiveRecord::Migration[7.1]
  def change
    change_column_null :favorite_lists, :meal_id, true
  end
end
