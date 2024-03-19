class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :showtime_id
      t.integer :seat_number
      t.string :user_name
      t.timestamps
    end
  end
end
