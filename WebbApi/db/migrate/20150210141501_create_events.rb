class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :edible
      t.integer :amount
      t.timestamps null: false
    end
  end
end
