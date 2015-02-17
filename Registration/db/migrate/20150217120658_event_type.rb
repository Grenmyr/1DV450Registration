class EventType < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.belongs_to :event, index: true
      t.belongs_to :type, index: true
    end
  end
end
