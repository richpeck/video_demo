class AddDescriptionToProfile < ActiveRecord::Migration
  def change
	add_column :profiles, :description, :string, :after => :user_id
	remove_column :profiles, :category_id
  end
end
