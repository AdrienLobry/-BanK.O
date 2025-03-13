class Favorite < ApplicationRecord
  belongs_to :meal
  belongs_to :favorite_list
end
