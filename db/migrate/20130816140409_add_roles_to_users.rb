class AddRolesToUsers < ActiveRecord::Migration
  def change
	remove_column :users, :role
	
	add_column :users, :admin, :boolean
	add_column :users, :member, :boolean
	add_column :users, :user, :boolean
  end
end
