class Venue < ApplicationRecord
  # Direct associations

  has_many   :top_picks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
