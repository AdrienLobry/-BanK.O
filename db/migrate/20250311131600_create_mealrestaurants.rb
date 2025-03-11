class CreateMealrestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :mealrestaurants do |t|
      t.references :meals, null: false, foreign_key: true
      t.references :restaurants, null: false, foreign_key: true

      t.timestamps
    end
  end
end
