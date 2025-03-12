class CreateMealRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_restaurants do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
