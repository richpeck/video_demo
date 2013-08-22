class AddNameToProfile < ActiveRecord::Migration
  def change
	add_column :profiles, :name, :string, :after => :user_id
  end
end
