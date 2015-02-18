class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :lat
      t.string :long
      t.belongs_to :events, index: true
      t.timestamps null: false
    end
  end
end
