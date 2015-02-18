class Event < ActiveRecord::Base

  has_many :event_types
  has_many :types, through: :event_types
  has_many :positions
  has_one :creator

  validates :name, presence: true,  length: { in: 3..100 }
  validates :amount, presence: true
  validates :edible, presence: true
end
