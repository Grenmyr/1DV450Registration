class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :lat
      t.string :lng
      t.belongs_to :event, index: true
      t.timestamps null: false
    end
  end
end
