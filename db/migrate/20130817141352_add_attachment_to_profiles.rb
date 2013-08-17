class AddAttachmentToProfiles < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :avatar
	add_column :profiles, :user_id, :integer, :after => :id
	
  end

  def self.down
    remove_attachment :profiles, :avatar
	remove_column :profiles, :user_id
  end
end
