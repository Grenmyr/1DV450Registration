class Event < ActiveRecord::Base
  has_many :event_types
  has_many :types, through: :event_types
  has_many :positions
  has_one :creator
end
