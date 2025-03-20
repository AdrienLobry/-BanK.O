class FavoriteList < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :meals, through: :favorites
end
