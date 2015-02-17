class EventType < ActiveRecord::Base
  belongs_to :event
  belongs_to :type
end
