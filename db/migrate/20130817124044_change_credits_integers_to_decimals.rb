class ChangeCreditsIntegersToDecimals < ActiveRecord::Migration
  def change
	change_column :credits, :value, :decimal, :precision => 10, :scale => 2
	change_column :credits, :balance, :decimal, :precision => 10, :scale => 2
  end
end
