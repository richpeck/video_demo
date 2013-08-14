class ChangeSessionIdName < ActiveRecord::Migration
  def change
	rename_column :videos, :sessionid, :sessionId
  end
end
