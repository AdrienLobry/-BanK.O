class Recipe < ApplicationRecord
  has_one :meal
  has_many :proportions
  has_many :ingredients, through: :proportions
end
