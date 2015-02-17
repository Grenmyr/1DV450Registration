class Event < ActiveRecord::Base
  has_many :events_tags
  has_many :tags, through: :events_tags
  has_many :positions
  has_one :creator
=begin
  has_many :tags
  has_and_belongs_to_many :tags
  has_many :positions
  has_one :creator
=end
end
