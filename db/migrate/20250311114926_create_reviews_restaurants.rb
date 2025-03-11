class CreateReviewsRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :review_restaurants do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.float :rating

      t.timestamps
    end
  end
end
