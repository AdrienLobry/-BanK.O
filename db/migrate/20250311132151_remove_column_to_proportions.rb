class RemoveColumnToProportions < ActiveRecord::Migration[7.1]
  def change
    remove_reference :proportions, :recipe, foreign_key: true, index: true
    add_reference :proportions ,:recipes, foreign_key: true
  end
end
