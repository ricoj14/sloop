class Name < ApplicationRecord
  # Direct associations

  has_many   :venues,
             :foreign_key => "neighborhood_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
