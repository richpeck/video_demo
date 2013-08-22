class ChangePortfoliosName < ActiveRecord::Migration
  def change
	rename_table :portfolios, :portfolio
  end
end
