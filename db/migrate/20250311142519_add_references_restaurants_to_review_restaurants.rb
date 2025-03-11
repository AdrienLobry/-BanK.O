class AddReferencesRestaurantsToReviewRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_reference :review_restaurants, :restaurants, null: false, foreign_key: true
  end
end
