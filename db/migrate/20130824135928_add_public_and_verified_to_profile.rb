class AddPublicAndVerifiedToProfile < ActiveRecord::Migration
  def change
	add_column :profiles, :public, :boolean, :after => :user_id
  end
end
