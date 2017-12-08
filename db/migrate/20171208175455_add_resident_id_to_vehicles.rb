class AddResidentIdToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :resident_id, :integer
  end
end

