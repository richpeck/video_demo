class ChangeRolesInUsers < ActiveRecord::Migration
  def change
	remove_column :users, :admin
	remove_column :users, :member
	remove_column :users, :user
	
	add_column :users, :role, :integer, :after => :id
  end
end
