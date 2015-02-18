class EventType < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.belongs_to :events, index: true
      t.belongs_to :types, index: true
    end
  end
end
