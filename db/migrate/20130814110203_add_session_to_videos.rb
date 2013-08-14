class AddSessionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :session_id, :string
  end
end
