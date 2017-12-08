class Loan < ApplicationRecord
  # Direct associations

  belongs_to :visitor_parking_permit,
             :foreign_key => "permit_id",
             :counter_cache => true

  belongs_to :vehicle,
             :counter_cache => :visitor_pass_uses_count

  belongs_to :resident, :class_name => "User"

  # Indirect associations



  # Validations
  validates :start_time, :end_time, :overlap => {:scope => "permit_id"}
  # validates :start_time, :end_time, :overlap => {:scope => "permit_id"}

  # validates :valid_date, :expiration_date, :overlap => {:scope => DateTime.now}
  
end
