class Mealrestaurant < ApplicationRecord
  belongs_to :meal
  belongs_to :restaurant
end
