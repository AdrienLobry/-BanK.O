class Meal < ApplicationRecord
  belongs_to :recipe
  has_many :meal_restaurants
  has_many :restaurants, through: :meal_restaurants
  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_localisation?
end
