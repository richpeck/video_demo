class ChangeSessionIdInVideos < ActiveRecord::Migration
  def change
	rename_column :videos, :session_id, :sessionid
  end
end
