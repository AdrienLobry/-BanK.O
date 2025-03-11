class Mealrestaurant < ApplicationRecord
  belongs_to :meals
  belongs_to :restaurants
end
