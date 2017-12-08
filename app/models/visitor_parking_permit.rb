class VisitorParkingPermit < ApplicationRecord
  # Direct associations

  has_many   :loans,
             :foreign_key => "permit_id"

  belongs_to :resident,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :activation_code, :presence => true

  validates :activation_code, :inclusion => { :in => [ '2018vispass1', '2018vispass2', '2018vispass3', '2018vispass4' ]  }

  validates :expiration_date, :presence => true

  validates :resident_id, :presence => true

  validates :valid_date, :presence => true
  
  # validates :valid_date, :expiration_date, :overlap => {datetime_new = DateTime.now}


end
