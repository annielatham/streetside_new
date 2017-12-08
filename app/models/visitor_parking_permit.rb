class VisitorParkingPermit < ApplicationRecord
  # Direct associations

  belongs_to :resident,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :activation_code, :presence => true

  validates :activation_code, :length => { :minimum => 12, :maximum => 12 }

  validates :activation_code, :inclusion => { :in => [ '2018vispass1', '2018vispass2', '2018vispass3', '2018vispass4' ]  }

  validates :expiration_date, :presence => true

  validates :resident_id, :presence => true

  validates :valid_date, :presence => true

end
