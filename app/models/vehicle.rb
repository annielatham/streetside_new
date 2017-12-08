class Vehicle < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :nickname, :uniqueness => { :scope => [:make, :license_plate, :model] }

  validates :nickname, :presence => true

  validates :year, :presence => true

end
