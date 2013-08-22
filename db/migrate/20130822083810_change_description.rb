class ChangeDescription < ActiveRecord::Migration
  def change
	change_column :profiles, :description, :string
  end
end
