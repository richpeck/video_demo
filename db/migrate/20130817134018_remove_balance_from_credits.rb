class RemoveBalanceFromCredits < ActiveRecord::Migration
  def change
	remove_column :credits, :balance
  end
end
