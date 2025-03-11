class AddReviewRestaurantsReferencesToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_reference :restaurants, :review_restaurants, null: false, foreign_key: true
  end
end
