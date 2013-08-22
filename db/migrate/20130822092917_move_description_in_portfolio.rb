class MoveDescriptionInPortfolio < ActiveRecord::Migration
  def change
	change_column :portfolio, :description, :text, :after => :user_id
  end
end
