class ChangeDescriptionToText < ActiveRecord::Migration
  def change
	change_column :profiles, :description, :text
  end
end
