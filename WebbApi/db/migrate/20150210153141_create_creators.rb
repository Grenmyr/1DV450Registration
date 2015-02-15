class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.belongs_to :event, index: true
      t.integer :submits
      t.string :name
      t.timestamps null: false
    end
  end
end
