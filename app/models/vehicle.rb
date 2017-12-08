class Vehicle < ApplicationRecord
  # Direct associations

  has_many   :visitor_pass_uses,
             :class_name => "Loan"

  has_one    :resident_parking_permit,
             :dependent => :nullify

  # Indirect associations

  has_one    :vehicle_owner,
             :through => :resident_parking_permit,
             :source => :resident

  # Validations

  validates :license_plate, :presence => true

  validates :license_plate, :length => { :minimum => 3, :maximum => 10 }

  validates :make, :presence => true

  validates :model, :presence => true

  validates :nickname, :uniqueness => { :scope => [:make, :license_plate, :model] }

  validates :nickname, :presence => true

  validates :year, :presence => true

end
