class RemoveReviewRestaurantsToRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_reference :restaurants, :review_restaurants, index: true, foreign_key: true
  end
end
