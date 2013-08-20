class AddUserIdToVideos < ActiveRecord::Migration
  def change
	add_column :videos, :user_id, :integer, :after => :id
  end
end
