class Restaurant < ApplicationRecord
  has_many :review_restaurants
  has_many :meal_restaurants
  has_many :meals, through: :meal_restaurants
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
