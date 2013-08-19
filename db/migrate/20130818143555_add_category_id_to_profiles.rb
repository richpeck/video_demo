class AddCategoryIdToProfiles < ActiveRecord::Migration
  def change
  
	add_column :profiles, :category_id, :integer, :after => :user_id
	
  end
end
