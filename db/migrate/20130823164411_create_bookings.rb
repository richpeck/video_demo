class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
	  t.integer :user_id
	  t.timestamp :start
	  t.timestamp :end
      t.timestamps
    end
  end
end
