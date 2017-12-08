class AddVisitorPassUseCountToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :visitor_pass_uses_count, :integer
  end
end
