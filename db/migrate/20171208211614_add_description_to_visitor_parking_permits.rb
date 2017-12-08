class AddDescriptionToVisitorParkingPermits < ActiveRecord::Migration[5.0]
  def change
      add_column :visitor_parking_permits, :description, :string
  end
end

