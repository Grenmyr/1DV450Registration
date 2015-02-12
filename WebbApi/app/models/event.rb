class Event < ActiveRecord::Base
  has_many :tags
  has_and_belongs_to_many :tags
end
