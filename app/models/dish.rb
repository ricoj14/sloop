class Dish < ApplicationRecord
  # Direct associations

  has_many   :top_picks,
             :dependent => :destroy

  belongs_to :cuisine

  # Indirect associations

  # Validations

end
