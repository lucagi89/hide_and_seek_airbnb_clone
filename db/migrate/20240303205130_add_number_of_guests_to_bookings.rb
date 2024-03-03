class AddNumberOfGuestsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :number_of_guests, :integer
  end
end
