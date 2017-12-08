class ResidentParkingPermit < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :resident_id, :uniqueness => { :scope => [:vehicle_id] }

  validates :resident_id, :presence => true

  validates :valid_date, :presence => true

end
