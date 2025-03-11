class Recipe < ApplicationRecord
  belongs_to :meals
  has_many :proportions
  has_many :ingredients, through :proportions
end
