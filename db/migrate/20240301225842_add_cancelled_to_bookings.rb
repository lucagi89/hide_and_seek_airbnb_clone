class AddCancelledToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :cancelled, :boolean, default: false
  end
end
