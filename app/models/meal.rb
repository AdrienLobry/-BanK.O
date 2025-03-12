class Meal < ApplicationRecord
  belongs_to :recipe

  geocoded_by :localisation
  after_validation :geocode, if: :will_save_change_to_localisation?

end
