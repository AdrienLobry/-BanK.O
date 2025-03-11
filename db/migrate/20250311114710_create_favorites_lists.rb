class CreateFavoritesLists < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_lists do |t|
      t.string :title
      t.string :localisation
      t.references :meals, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
