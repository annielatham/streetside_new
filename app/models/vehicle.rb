class Vehicle < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :license_plate, :presence => true

  validates :license_plate, :length => { :minimum => 3, :maximum => 10 }

  validates :make, :presence => true

  validates :model, :presence => true

  validates :nickname, :uniqueness => { :scope => [:make, :license_plate, :model] }

  validates :nickname, :presence => true

  validates :year, :presence => true

end
