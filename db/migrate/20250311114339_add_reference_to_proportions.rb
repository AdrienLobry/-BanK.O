class AddReferenceToProportions < ActiveRecord::Migration[7.1]
  def change
    add_reference :proportions, :recipe, null: false, foreign_key: true
  end
end
