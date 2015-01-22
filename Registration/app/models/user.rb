class User < ActiveRecord::Base
  has_one :api
  validates :username, presence: true,  length: { in: 6..30 }
  validates :password, presence: true,  length: { in: 6..255 }
end
