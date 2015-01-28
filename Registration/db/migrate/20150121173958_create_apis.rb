class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :key, :limit => (255)
      t.belongs_to :user

      t.timestamps null: false
    end
    #add_foreign_key :apis, :users
  end
end
