class Tag < ActiveRecord::Base
  has_many :events_tags
  has_many :events, through: :events_tags
  #has_and_belongs_to_many :events
end
