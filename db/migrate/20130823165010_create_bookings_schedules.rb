class CreateBookingsSchedules < ActiveRecord::Migration
  def self.up
    create_table :bookings_schedules, :id => false do |t|
      t.references :booking, :schedule
    end
  end
 
  def self.down
    drop_table :bookings_schedules
  end
  
end
