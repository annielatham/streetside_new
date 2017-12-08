class Loan < ApplicationRecord
  # Direct associations

  belongs_to :visitor_parking_permit,
             :foreign_key => "permit_id",
             :counter_cache => true

  belongs_to :vehicle,
             :counter_cache => :visitor_pass_uses_count

  # Indirect associations

  has_one    :lender,
             :through => :visitor_parking_permit,
             :source => :resident

  # Validations

end
