class Restaurant < ApplicationRecord
  has_many :review_restaurants
  belongs_to_many :meal_restaurants
end
