class AddPortfolioImages < ActiveRecord::Migration
  def change
	add_attachment :portfolio, :cover_image
	add_column :portfolio, :description, :text
  end
end
