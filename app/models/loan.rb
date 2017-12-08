class Loan < ApplicationRecord
  # Direct associations

  belongs_to :vehicle,
             :counter_cache => :visitor_pass_uses_count

  # Indirect associations

  # Validations

end
