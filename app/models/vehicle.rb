class Vehicle < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :nickname, :presence => true

  validates :year, :presence => true

end
