class UsersCategoriesHabtm < ActiveRecord::Migration
  def self.up
    create_table :categories_profiles, :id => false do |t|
      t.references :category, :profile
    end
  end
 
  def self.down
    drop_table :categories_profiles
  end
  
end
