class AddStartAndEndToSchedules < ActiveRecord::Migration
  def change
	add_column :schedules, :start, :datetime, :after => :user_id
	add_column :schedules, :end, :datetime, :after => :start
	add_column :schedules, :public, :boolean, :after => :end
	add_column :schedules, :available, :boolean, :after => :end
  end
end
