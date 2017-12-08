class ResidentParkingPermit < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :activation_code, :length => { :minimum => 12, :maximum => 12 }

  validates :activation_code, :inclusion => { :in => [ '2018respass1', '2018respass2', '2018respass3', '2018respass4' ]  }

  validates :expiration_date, :presence => true

  validates :resident_id, :uniqueness => { :scope => [:vehicle_id] }

  validates :resident_id, :presence => true

  validates :valid_date, :presence => true

end
