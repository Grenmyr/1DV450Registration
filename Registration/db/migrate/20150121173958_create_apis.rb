class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :key
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
