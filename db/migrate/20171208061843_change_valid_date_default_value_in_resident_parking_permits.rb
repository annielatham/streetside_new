class ChangeValidDateDefaultValueInResidentParkingPermits < ActiveRecord::Migration[5.0]
  def change
    change_column_default :resident_parking_permits, :valid_date, '2018, 1, 1, 0, 0, 0'
  end
end
