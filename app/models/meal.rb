class Meal < ApplicationRecord
  belongs_to :recipe
  has_many :meal_restaurants
  has_many :restaurants, through: :meal_restaurants
end
