class ToRenameColumnCustomerIdToUserIdBookings < ActiveRecord::Migration[7.0]
  def change
drop_table :bookings
  end
end
