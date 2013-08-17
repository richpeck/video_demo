class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :user_id
      t.integer :value
      t.string :description
      t.text :source
      t.integer :balance

      t.timestamps
    end
  end
end
