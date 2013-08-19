class RemoveCategoriesProfiles < ActiveRecord::Migration
  def self.up
	drop_table :categories_profiles
    create_table :categories_users, :id => false do |t|
      t.references :category, :user
    end
  end
 
  def self.down
    drop_table :categories_users
  end
end
