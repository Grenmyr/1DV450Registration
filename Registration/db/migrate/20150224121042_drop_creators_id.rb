class DropCreatorsId < ActiveRecord::Migration
  def change
      remove_column :events, :creators_id
  end
end
