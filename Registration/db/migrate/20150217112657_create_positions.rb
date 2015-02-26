class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.float :lat
      t.float :lng
      t.belongs_to :event, index: true
      t.timestamps null: false
    end
  end
end
