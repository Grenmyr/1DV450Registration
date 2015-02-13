class Event < ActiveRecord::Base
  has_many :tags
  has_and_belongs_to_many :tags
  has_many :positions
end
