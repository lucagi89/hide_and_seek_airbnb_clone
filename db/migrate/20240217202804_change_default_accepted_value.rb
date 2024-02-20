class ChangeDefaultAcceptedValue < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :accepted, from: nil, to: false
  end
end
