class CreateResidentParkingPermits < ActiveRecord::Migration
  def change
    create_table :resident_parking_permits do |t|
      t.integer :resident_id
      t.integer :vehicle_id
      t.datetime :valid_date
      t.datetime :expiration_date
      t.string :activation_code

      t.timestamps

    end
  end
end
