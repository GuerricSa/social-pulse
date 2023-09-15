class RenameTableRegistrations < ActiveRecord::Migration[7.0]
  def change
    rename_table :registrations, :bookings
  end
end
