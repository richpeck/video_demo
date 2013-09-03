class ChangeVideosToBroadcasts < ActiveRecord::Migration
  def change
	rename_table :videos, :broadcasts
  end
end
