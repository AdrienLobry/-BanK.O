class CreateReviewRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :review_restaurants do |t|
      t.string :title
      t.string :content
      t.float :rating

      t.timestamps
    end
    add_reference :review_restaurants, :restaurant, null: false, foreign_key: true
    add_reference :review_restaurants, :user, null: false, foreign_key: true

  end
end
