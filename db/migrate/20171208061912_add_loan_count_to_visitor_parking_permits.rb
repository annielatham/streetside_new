class AddLoanCountToVisitorParkingPermits < ActiveRecord::Migration[5.0]
  def change
    add_column :visitor_parking_permits, :loans_count, :integer
  end
end
