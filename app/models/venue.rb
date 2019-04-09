class Venue < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :class_name => "Name"

  has_many   :top_picks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
