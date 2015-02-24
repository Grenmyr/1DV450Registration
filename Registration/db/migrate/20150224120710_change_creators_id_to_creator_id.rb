class ChangeCreatorsIdToCreatorId < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.references :creator
    end
  end
end
