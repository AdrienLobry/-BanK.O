class Restaurant < ApplicationRecord
  has_many :review_restaurants
  has_many :meal_restaurants
end
