class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorite_lists
  # has_many :meals, through: :favorite_lists // buggued
  has_many :favorites, through: :favorite_lists
end
