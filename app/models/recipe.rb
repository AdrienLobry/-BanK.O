class Recipe < ApplicationRecord
  has_many :meals
  has_many :proportions
  has_many :ingredients, trough :proportions
end
