class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :creators, index: true
      t.string :name
      t.boolean :edible
      t.integer :taste
      t.timestamps null: false
    end
  end
end
