class AddResidentIdToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :resident_id, :integer
  end
end
