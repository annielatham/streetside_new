class CreateVisitorParkingPermits < ActiveRecord::Migration
  def change
    create_table :visitor_parking_permits do |t|
      t.integer :resident_id
      t.datetime :valid_date
      t.datetime :expiration_date
      t.string :activation_code

      t.timestamps

    end
  end
end
